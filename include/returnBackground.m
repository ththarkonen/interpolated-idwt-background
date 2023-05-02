function [bg] = returnBackground( c, p, backgroundMatrix)
% Computation of a background using the parameters c and p for a
% pre-computed background matrix.
% c: constant offset for the background
% p: interpolated discrete wavelet transform level
%
% Teemu Härkönen 2022

    ind = floor(p);
    beta = p - ind;
    ind = ind + 1;
    
    detailLevel = backgroundMatrix( :, ind);
    detailNextLevel = backgroundMatrix( :, ind + 1);

    interpolatedPart = beta * ( detailNextLevel - detailLevel );
    bg = detailLevel + interpolatedPart;
    bg = bg + c;
end