function plot2file(figure, Options, ImageTitle)
%plot2file Saves png and fig files of the selected figure
    exportgraphics(figure, ImageTitle+'.png','Resolution',Options.DPI)
    savefig(ImageTitle+'.fig')
end