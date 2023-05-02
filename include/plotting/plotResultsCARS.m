function [h] = plotResultsCARS( outputObject )

    x = outputObject.x;
    y = outputObject.y;

    epsilon = outputObject.epsilon;
    S = outputObject.correctedSpectrum;
    imChi3 = outputObject.imChi3;

    nuLabel = "$\nu$";
    intensityLabel = "CARS Intensity";
    ramanIntensityLabel = "Raman intensity"; 

    legendStringRaman = "Im$\{\chi_3(\nu)\}$";
    legendStrings = ["$z(\nu)$", "$S(\nu)$",...
                     "$\varepsilon(\nu; \hat{p}, \hat{\mathcal{M}})$"];

    legendLocation = "northwest";
    lineWidth = 2;
    fontSize = 25;
    xDirection = "reverse";
    
    figure();
    hold on
    
    h = plot( x, y);
    h.LineWidth = lineWidth;
    
    h = plot( x, S);
    h.LineWidth = lineWidth;
    
    yyaxis right
    h = plot( x, epsilon);
    h.LineWidth = lineWidth;
    h.Color = 'black';
    
    ax = gca();
    ax.YColor = 'black';
    
    yyaxis left
    
    h = xlabel( nuLabel );
    h.Interpreter = "latex";
    
    h = ylabel( intensityLabel );
    h.Interpreter = "latex";
    
    h = legend( legendStrings );
    h.Interpreter = "latex";
    h.Location = legendLocation;
    
    ax = gca();
    ax.FontSize = 25;
    ax.XDir = xDirection;
    
    axis tight
    
    figure();
    tiledlayout( 2, 1);
    
    nexttile();
    hold on
    
    h = plot( x, y);
    h.LineWidth = lineWidth;
    
    h = plot( x, S);
    h.LineWidth = lineWidth;
    
    yyaxis right
    h = plot( x, epsilon);
    h.LineWidth = lineWidth;
    h.Color = 'black';
    
    ax = gca();
    ax.YColor = 'black';
    
    yyaxis left
    
    h = xlabel( nuLabel );
    h.Interpreter = "latex";
    
    h = ylabel( intensityLabel );
    h.Interpreter = "latex";
    
    h = legend( legendStrings );
    h.Interpreter = "latex";
    h.Location = legendLocation;
    
    ax = gca();
    ax.FontSize = fontSize;
    ax.XDir = xDirection;
    
    axis tight
    
    nexttile();
    hold on
    
    h = plot( x, imChi3);
    h.LineWidth = lineWidth;
    
    ax = gca();
    ax.FontSize = fontSize;
    ax.XDir = xDirection;
    
    h = xlabel( nuLabel );
    h.Interpreter = "latex";
    
    h = ylabel( ramanIntensityLabel );
    h.Interpreter = "latex";
    
    h = legend( legendStringRaman );
    h.Interpreter = "latex";
    h.Location = legendLocation;
    
    axis tight
    h = 0;
end