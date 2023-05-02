function [outputObject] = correctRaman( x, y, pMax)

    includeFolders = genpath('include');
    addpath( includeFolders );

    x = x(:);
    y = y(:);

    % Precomputed wavelet filters
    prefilters = load('./include/wavelets/prefilters.mat');
    waveletStruct = prefilters.waveletStruct;
    
    wnames = fieldnames( waveletStruct );
    nWavelets = length( wnames );
    
    optimalP = zeros( nWavelets, 1);
    costFunValues = Inf( nWavelets, 1);
    
    nMax = 20;
    pInit = pMax - 2;
    
    for ii = 1:nWavelets
    
        wname_ii = wnames{ii};
        filters_ii = waveletStruct.( wname_ii );
        bgMatrix_ii = computeBackgroundMatrix( y, filters_ii, nMax);

        optFun_ii = @(p) spectrumNorm( y, p, bgMatrix_ii, pMax);
        [ optP_ii, val_ii] = fminsearch( optFun_ii, pInit);
    
        optimalP(ii) = optP_ii;
        costFunValues(ii) = val_ii;
    end
    
    [ ~, ind] = min( costFunValues );
           
    optimizedP = optimalP(ind);
    optimizedWavelet = wnames{ind};
    filters = waveletStruct.( optimizedWavelet );
    
    bgMatrix = computeBackgroundMatrix( y, filters, nMax);  
    background =  returnBackground( 0, optimizedP, bgMatrix);

    correctedSpectrum = y - background;
    minOptS = min( correctedSpectrum );
    correctedSpectrum = correctedSpectrum - minOptS;

    outputObject = {};
    outputObject.x = x;
    outputObject.y = y;

    outputObject.background = background + minOptS;
    outputObject.correctedSpectrum = correctedSpectrum;

    outputObject.optimizedP = optimizedP;
    outputObject.optimizedWavelet = optimizedWavelet;
end