function [d] = spectrumNorm( y, p, bgMatrix, pMax)
   
    if( p > pMax )
        d = Inf;
        return;
    end

    try
        B =  returnBackground( 0, p, bgMatrix);
        S = y - B;
        S = S - min(S);
    
        d = sum( abs(S) );
    catch
        d = Inf;
    end
end