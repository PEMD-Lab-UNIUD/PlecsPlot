function Options = plotOptions_V2()
%plotOptions gives a structure with all the Options fields

    Options.DPI  = 400;
    Options.Units = 'normalized';
    Options.Width = 1;
    Options.Height = 1;

    Options.LineWidth = 3;
    Options.Line2Width = 5;

%     Options.FontSizeTitle = 18;
%     Options.FontSizeTick = 13;
%     Options.FontSizeLabel = 14;
%     Options.FontSizeLegend = 10;

    Options.FontSizeTitle = 30;
    Options.FontSizeTick = 20;
    Options.FontSizeLabel = 24;
    Options.FontSizeLegend = 20;

    Options.VlineStyle = '--';
    Options.VlineColor = 'k';
    Options.HlineStyle = '--';
    Options.HlineColor = 'k';


    Options.Color.Green   = "#00CC00";
    Options.Color.Red     = "#FF0000";
    Options.Color.Blue    = "#0099FF";
    Options.Color.Yellow  = "#FFCC00";
    Options.Color.Magenta = "#FF00FF";
    Options.Color.Orange  = "#33CCCC";
    Options.Color.Default = [Options.Color.Green, Options.Color.Red, Options.Color.Blue, Options.Color.Yellow, Options.Color.Magenta, Options.Color.Orange];

    Options.Style.None = "none";
    Options.Style.Line = "-";
    Options.Style.Dashed = "--";
    Options.Style.Dotted = ":";
    Options.Style.DashDot = "-.";

    Options.Marker.None = "none";
    Options.Marker.Circle = "o";
    Options.Marker.Plus = "+";
    Options.Marker.Ast = "*";
    Options.Marker.Point = '.';
    Options.Marker.Cross = "x";
    Options.Marker.Hline = "_";
    Options.Marker.Vline = "|";
    Options.Marker.Square = "s";
    Options.Marker.Diamond = "d";
    Options.Marker.UpTri = "^";
    Options.Marker.DownTri = "v";
    Options.Marker.RigthTri = ">";
    Options.Marker.LeftTri = "<";
    Options.Marker.Star5 = "p";
    Options.Marker.Star6 = "h";
   
    Options.Interpreter = 'latex';
end