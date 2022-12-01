function plot2file(figure, Options, ImageTitle)
%plot2file Saves png and fig files of the selected figure
    exportgraphics(figure, ImageTitle+'.png','Resolution',Options.DPI)
    exportgraphics(figure, ImageTitle+'.pdf','Resolution',Options.DPI)
    exportgraphics(figure, ImageTitle+'.eps','Resolution',Options.DPI)
%     savefig(ImageTitle+'.fig')
end