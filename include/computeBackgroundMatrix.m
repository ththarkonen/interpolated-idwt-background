function [bgMat] = computeBackgroundMatrix( y, filters, nMax)
% Computation of the background matrix needed for the background model.
% Required only once per spectrum.
%
% Teemu Härkönen 2022
    
    nData = length( y );

    LoD = filters.LoD;
    HiD = filters.HiD;
    
    LoR = filters.LoR;
    HiR = filters.HiR;
    
    [c,l] = wavedec( y, nMax, LoD, HiD);
    
    bgMat = zeros( nMax, nData);
    
    for jj = 1:nMax
        
        detailRec = wrcoef ('d', c, l, LoR, HiR, nMax -jj + 1);
        bgMat( jj, :) = detailRec;
    end
    
    bgMat = cumsum(bgMat)';
end