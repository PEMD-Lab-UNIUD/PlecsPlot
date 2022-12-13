function plot2file(figure, Options, ImageTitle)
%plot2file Saves png and fig files of the selected figure

    if ~exist('../Fig', 'dir')
        mkdir('../Fig')
    end  
    
    exportgraphics(figure, '..\Fig\'+ImageTitle+'.png','Resolution',Options.DPI)
    exportgraphics(figure, '..\Fig\'+ImageTitle+'.pdf','ContentType','vector')
%     savefig(ImageTitle+'.fig')
end