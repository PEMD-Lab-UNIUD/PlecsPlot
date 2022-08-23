function Options = plotOptions()
%plotOptions gives a structure with all the Options fields

    Options.DPI  = 1200;
    Options.Units = 'centimeters';
    Options.Width = 20;
    Options.Height = 12;

    Options.LineWidth = 1;
    Options.Line2Width = 3;

%     Options.FontSizeTitle = 18;
%     Options.FontSizeTick = 13;
%     Options.FontSizeLabel = 14;
%     Options.FontSizeLegend = 10;

    Options.FontSizeTitle = 14;
    Options.FontSizeTick = 10;
    Options.FontSizeLabel = 12;
    Options.FontSizeLegend = 8;

    Options.VlineStyle = '--';
    Options.VlineColor = 'k';
    Options.HlineStyle = '--';
    Options.HlineColor = 'k';
%    Options.Color = ["#00CC00", "#FF0000", "#0099FF", "#FFCC00", "#FF00FF", "#33CCCC"];
    Options.Color = ["#00CC00", "#FF0000", "#0099FF", "#FFCC00", "#FF00FF", "#33CCCC", ... 
                    "#00CC00", "#FF0000", "#0099FF", "#FFCC00", "#FF00FF", "#33CCCC", ... 
                    "#00CC00", "#FF0000", "#0099FF", "#FFCC00", "#FF00FF", "#33CCCC", ... 
                    "#00CC00", "#FF0000", "#0099FF", "#FFCC00", "#FF00FF", "#33CCCC"];

%     Options.Color = ["#00CC00", "#00CC00","#00CC00","#00CC00" ] ;

    Options.Interpreter = 'latex';
end