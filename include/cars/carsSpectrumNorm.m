function [d] = carsSpectrumNorm( logY, p, bgMatrix, pMax)
   
    if( p > pMax )
        d = Inf;
        return;
    end

    try
        logEpsilon =  returnBackground( 0, p, bgMatrix);
        logS = logY - logEpsilon;
        S = exp( logS );
        
        % Computation of the Raman signal
        imChi3 = computeImChi3(S);
        
        absImChi3 = abs( imChi3 );
        d = sum( absImChi3 );
    catch
        d = Inf;
    end
end