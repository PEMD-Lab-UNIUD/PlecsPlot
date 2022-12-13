function Options = plotOptions_V2()
%plotOptions gives a structure with all the Options fields

    %% Defaults values

    Interpreter = "none";
    Font = "Palatino Linotype";

    %% Export Options

    Options.DPI  = 400;
    Options.Units = 'normalized';
    Options.Width = 1;
    Options.Height = 1;

    %% Graph Style primitives: colors, line style and point marker

    Options.Color.Green   = "#00CC00";
    Options.Color.Red     = "#FF0000";
    Options.Color.Blue    = "#0099FF";
    Options.Color.Yellow  = "#FFCC00";
    Options.Color.Magenta = "#FF00FF";
    Options.Color.Orange  = "#33CCCC";
    ColorOrder = char([Options.Color.Green; Options.Color.Red; Options.Color.Blue; Options.Color.Yellow; Options.Color.Magenta; Options.Color.Orange]);
    Options.Axis.ColorOrder  = hex2rgb(ColorOrder);

    Options.LineStyle.None = "none";
    Options.LineStyle.Line = "-";
    Options.LineStyle.Dashed = "--";
    Options.LineStyle.Dotted = ":";
    Options.LineStyle.DashDot = "-.";

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

    %% Default plot style
  
    Options.Style.LineWidth = 3;
    
    %% Default line style

    Options.Line.LineStyle = '--';
    Options.Line.Color = 'k';
    Options.Line.LineWidth = 3;

    %% Default title Style

    Options.Title.Interpreter = Interpreter;
    Options.Title.FontSize = 30;    
    Options.Title.FontName = Font;

    %% Default labels and ticks Style

    Options.Axis.TickLabelInterpreter = Interpreter;
    Options.Axis.FontSize = 20;
    Options.Label.Interpreter = Interpreter;
    Options.Label.FontSize = 24;

    %% Default legend Style

    Options.Legend.Interpreter = Interpreter;
    Options.Legend.FontSize = 20;

    %% Default annotation Style

    Options.Note.Interpreter = Interpreter;
    Options.Note.FontSize = 14;

end