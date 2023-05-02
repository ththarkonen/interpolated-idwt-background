function [h] = plotResultsRaman( outputObject )
    
    x = outputObject.x;
    y = outputObject.y;

    background = outputObject.background;
    correctedSpectrum = outputObject.correctedSpectrum;

    nuLabel = "$\nu$";
    intensityLabel = "Intensity";
    legendStrings = ["$y(\nu)$", "$f(\nu)$", "$B(\nu; \hat{p}, \hat{\mathcal{M}})$"];

    legendLocation = "northwest";
    lineWidth = 2;
    fontSize = 25;
    xDirection = "reverse";

    figure();
    hold on
    
    h = plot( x, y);
    h.LineWidth = lineWidth;
    
    h = plot( x, correctedSpectrum );
    h.LineWidth = lineWidth;
    
    h = plot( x, background );
    h.LineWidth = lineWidth;
    h.Color = 'black';
    
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
    h = 0;
end