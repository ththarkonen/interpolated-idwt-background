function [imChi3] = computeImChi3( S )
% Computation of the Raman signal using a corrected CARS spectrum S

    ii = 1:length(S);

    % Compute the MEM phase
    MEM = -mem_analysis_dct( S, ii, length(ii) );
    MEM = MEM - min(MEM);
    
    % Real and imaginary parts computed using the MEM phase
    imChi3 = sqrt(S) .* sin(MEM);
%     ReChi3 = sqrt(y) .* cos(MEM);
%     chi3 = complex(ReChi3,ImChi3);
end