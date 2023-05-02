function [outputObject] = correctCARS( x, y, pMax)

    includeFolders = genpath('include');
    addpath( includeFolders );

    x = x(:);
    y = y(:);
    logY = log(y);
    
    % Precomputed wavelet filters
    prefilters = load('./include/wavelets/prefilters.mat');
    waveletStruct = prefilters.waveletStruct;
    
    waveletNames = fieldnames( waveletStruct );
    nWavelets = length( waveletNames );
    
    optimalPs = zeros( nWavelets, 1);
    costFunValues = Inf( nWavelets, 1);
    
    nMax = 20;
    pInit = pMax - 4;
    
    for ii = 1:nWavelets
    
        wname_ii = waveletNames{ii};
        filters_ii = waveletStruct.( wname_ii );
        bgMatrix_ii = computeBackgroundMatrix( logY, filters_ii, nMax);

        optFun_ii = @(p) carsSpectrumNorm( logY, p, bgMatrix_ii, pMax);
        [ optP_ii, val_ii] = fminsearch( optFun_ii, pInit);
    
        optimalPs(ii) = optP_ii;
        costFunValues(ii) = val_ii;
    end
    
    [ ~, optimalIndex] = min( costFunValues );
           
    optimizedP = optimalPs( optimalIndex );
    optimizedWavelet = waveletNames{ optimalIndex };

    filters = waveletStruct.( optimizedWavelet );
    bgMatrix = computeBackgroundMatrix( logY, filters, nMax);
    
    logEpsilon =  returnBackground( 0, optimizedP, bgMatrix);
    epsilon = exp( logEpsilon );

    logS = logY - logEpsilon;
    S = exp(logS);
    
    % Computation of the Raman signal
    imChi3 = computeImChi3(S);

    outputObject = {};
    outputObject.x = x;
    outputObject.y = y;

    outputObject.epsilon = epsilon;
    outputObject.correctedSpectrum = S;
    outputObject.imChi3 = imChi3;

    outputObject.optimizedP = optimizedP;
    outputObject.optimizedWavelet = optimizedWavelet;
end