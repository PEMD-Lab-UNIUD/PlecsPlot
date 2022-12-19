function plot2file(figure, Options, ImageTitle)
%plot2file Saves the selected figure in a picture
%   looks for environment variable 'save2filemode' which is true or false
    switch getenv('save2filemode')
        case 'true'
            if ~exist('../Fig', 'dir')
                mkdir('../Fig')
            end
    
            exportgraphics(figure, '..\Fig\'+ImageTitle+'.png','Resolution',Options.DPI, 'ContentType', 'image')
            message = sprintf("Figure %s.png saved succesfully \f", ImageTitle);
            debugout(message)
    
            exportgraphics(figure, '..\Fig\'+ImageTitle+'.pdf','ContentType','vector')
            message = sprintf("Figure %s.pdf saved succesfully \f", ImageTitle);
            debugout(message)

        otherwise
            message = sprintf("Disabled File output of Figure %s", ImageTitle);
            debugout(message)
    end
end
