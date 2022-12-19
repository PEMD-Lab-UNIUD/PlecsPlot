clc
clear
close all

filename ="TorqueSpeed";

warning('on','all')
debugmode(true)
% outputmode(false)
save2filemode(false)


%% Data to plot

x = linspace(0,10,100);

y1 = sin(x);
y2 = sin(2*x);
y3 = cos(3*x);
y4 = cos(4*x);


%% Plot parameter definition
Options = plotOptions_V2();

%% PLOT TO FILE
ImageTitle = "sample";

%% PLOT 1
Plot(1).Layout = [2 2];
Plot(1).Title.String = "Example Title";

% Leave an empty string to skip a trace in the legend
Plot(1).Legend.String = {'Example Legend entry 1', '', 'Example Lengend entry 3'};
Plot(1).Legend.Style.Location = 'east';
Plot(1).Legend.Style.NumColumns = 1;

Plot(1).Vline(1).X = 0.01;
% Plot(1).Vline(1).Y = [-inf inf];
Plot(1).Vline(2).X = 0.1;
Plot(1).Vline(2).Y = [-100 1500];

Plot(1).Vline(1).Style.Color = "red"; 
Plot(1).Hline(1).X = [0 0.6];
Plot(1).Hline(1).Y = 0.5;



% Plot(1).Trace(1).Style.Color = Options.Color.Red;
% Plot(1).Trace(2).Style.Color = Options.Color.Blue;

% Plot(1).Trace(1).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(1).Trace(2).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(1).Trace(3).Style.LineStyle = Options.LineStyle.Dashed;

% Plot(1).Trace(1).Style.Marker = Options.Marker.Ast;
% Plot(1).Trace(2).Style.Marker = Options.Marker.Circle;
Plot(1).Trace(3).Style.Marker = Options.Marker.Cross;
Plot(1).Trace(3).Style.MarkerSize = 20;

Plot(1).Trace(1).Y = y1;
Plot(1).Trace(2).Y = y2;
Plot(1).Trace(3).Y = y3;
Plot(1).Trace(1).X = x;
Plot(1).Trace(2).X = x;
Plot(1).Trace(3).X = x;

Plot(1).YLabel.String= "Sample Ylabel";
Plot(1).XLabel.String = '';
% Plot(1).Axis.XTickLabel = '';
Plot(1).Axis.YLim = [ ];
Plot(1).Axis.XLim = [ ];
Plot(1).Axis.XLim = [1 9 ];
Plot(1).Axis.XScale = 'linear';
Plot(1).Axis.YScale = 'linear';

Plot(1).Axis.XGrid = 'on';
Plot(1).Axis.YGrid = 'on';

Plot(1).Axis.XMinorGrid = 'on';
Plot(1).Axis.YMinorGrid = 'on';

%% PLOT 2
Plot(2).Rows = 2;
Plot(2).Columns = 3;
Plot(2).Layout = [4 2];
Plot(2).Title.String = "GRANDE";

Plot(2).Legend.String = {'Example Legend'};
Plot(2).Legend.Style.Location = 'NorthEast';
Plot(2).Legend.Style.NumColumns = 1;


Plot(2).Trace(1).Y = y1;
Plot(2).Trace(2).Y = y2;
Plot(2).Trace(3).Y = y3;
Plot(2).Trace(1).X = x;
Plot(2).Trace(2).X = x;
Plot(2).Trace(3).X = x;

Plot(2).YLabel.String = "Sample Ylabel";
Plot(2).XLabel.String = '';

Plot(2).Axis.XLim = [1 9 ];

Plot(2).Zoom(1).X = [2 5];
Plot(2).Zoom(1).Y = [0.7 0];
Plot(2).Zoom(1).XPosition = [6 8];
Plot(2).Zoom(1).YPosition = [0.7 -0.5];

Plot(2).Axis.XGrid = 'on';
Plot(2).Axis.YGrid = 'on';

% Plot(2).Axis.XMinorGrid = 'on';
% Plot(2).Axis.YMinorGrid = 'on';



% Plot(2).Axis.YTick = [ ];
% Plot(2).Axis.YLim = [ ];
% Plot(2).Axis.XLim = [ ];


% Note(1).Type = 'textbox';
% Note(1).XPosition = [0.3 0.6];
% Note(1).YPosition = [60 40];
% Note(1).Text  = 'test array';
% 
% 
% Note(1).Style.FitBoxToText  = 'on';
% Note(1).Style.LineStyle  = 'none';
% Note(1).Style.Color  = 'Red';


% Note(1).Type = 'rectangle';

% Note(1).Text  = 'test array';
% Note(1).Style.LineStyle  = '-.';
% Note(1).Style.LineWidth  = 5;
% Note(1).Style.Color  = 'blue';
% Note(1).Style.FaceColor = 'red';
% Note(1).Style.FaceAlpha = .2;
% Note(1).Style.LineStyle = ':';


% % Note(3).Family = 3;
% Note(3).Type = 'textarrow';
% Note(3).XPosition = [0.6 0.3];
% Note(3).YPosition = [30 60];
% Note(3).Text  = 'test array arrow';
% Note(3).Style.LineStyle  = '--';
% Note(3).Style.Color  = 'red';


% Plot(2).Note = Note;

% t = (1/16:1/8:1)'*2*pi;

% Plot(2).Fill(1).X = 0.5*cos(t);
% Plot(2).Fill(1).Y = 10*sin(t)+10;
% Plot(2).Fill(1).Style.FaceColor = [0.8 0.7 1];
% Plot(2).Fill(1).Style.FaceAlpha = .5;
% Plot(2).Fill(1).Style.LineStyle = ':';
% 
% Plot(2).Fill(2).X = 0.5*cos(t);
% Plot(2).Fill(2).Y = 10*sin(t)+10;
% Plot(2).Fill(2).Style.FaceColor = [0.8 0.7 1];


%% PLOT 3
Plot(3).Rows = 2;
Plot(3).Columns = 3;
Plot(3).Layout = [2 2];
Plot(3).Title.String = "Example Title";

Plot(3).Legend.String = {'Example Legend'};
Plot(3).Legend.Style.Location = 'NorthEast';
Plot(3).Legend.Style.NumColumns = 1;

Plot(3).Trace(1).Y = y1;
Plot(3).Trace(2).Y = y2;
Plot(3).Trace(3).Y = y3;
Plot(3).Trace(1).X = x;
Plot(3).Trace(2).X = x;
Plot(3).Trace(3).X = x;

Plot(3).Area(1).Y = y1;
Plot(3).Area(1).X = x;
Plot(3).Area(1).Style.FaceColor = Options.Color.Green;



Plot(3).YLabel.String = "Sample Ylabel";
Plot(3).XLabel.String = '';

Plot(3).Axis.XLim = [1 9 ];

% Plot(3).Zoom(1).X = [2 5];
% Plot(3).Zoom(1).Y = [0.7 0];
% Plot(3).Zoom(1).XPosition = [6 8];
% Plot(3).Zoom(1).YPosition = [0.7 -0.5];

Plot(3).Axis.XGrid = 'on';
Plot(3).Axis.YGrid = 'on';

%% Plot 4 annotation
Plot(4).Rows = 1;
Plot(4).Columns = 1;
Plot(4).Layout = 'south';

% Plot(3).Title.String = "annotation space";

% Plot(3).Legend.String = {'Example Legend'};
% Plot(3).Legend.Style.Location = 'NorthEast';
% Plot(3).Legend.Style.NumColumns = 1;


Plot(4).Trace(1).Y = y1;
Plot(4).Trace(1).X = x;
Plot(4).Trace(1).Style.LineStyle = Options.LineStyle.None;

Plot(4).Axis.YLim = [0 1];
Plot(4).Axis.XLim = [1 9];
Plot(4).YLabel.String = '';
Plot(4).XLabel.String = '';
Plot(4).Axis.XTickLabel = '';
Plot(4).Axis.YTickLabel = '';
Plot(4).Axis.Box='off';
Plot(4).Axis.XColor='none';
Plot(4).Axis.YColor='none';


% Plot(3).YLabel.String = "Sample Ylabel";
% Plot(3).XLabel.String = '';

% Plot(3).Zoom(1).X = [2 5];
% Plot(3).Zoom(1).Y = [0.7 0];
% Plot(3).Zoom(1).XPosition = [6 8];
% Plot(3).Zoom(1).YPosition = [0.7 -0.5];

Plot(4).Note(1).Type = 'rectangle';
Plot(4).Note(1).XPosition = [2 7];
Plot(4).Note(1).YPosition = [0.5 0];
% Plot(3).Note(1).Text  = 'test array';
Plot(4).Note(1).Style.FitBoxToText  = 'on';
% Plot(3).Note(1).Style.LineStyle  = 'none';
Plot(4).Note(1).Style.Color  = 'Red';


% Plot(3) = Plot(1);

% Plot = Plot(1:3);

%% PLOT
fig1 = figure('Name', ImageTitle, 'WindowState', 'maximized'); 
drawnow;
layout = [0 0];

for i=1:length(Plot)
    if isnumeric(Plot(i).Layout)
layout = layout + Plot(i).Layout;
    end
end 


t = tiledlayout(4, 4,'Padding','tight','TileSpacing','tight'); %tight
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];

for i=1:length(Plot)
  axes(i) = nexttile(t, Plot(i).Layout);
  PLECSplot(Plot(i), Options)
end


%   nexttile(t, [3,1]);
%   PLECSplot(Plot(1), Options)
%   nexttile(t, [3,1]);
% PLECSplot(Plot(2), Options)
%   nexttile(t, [1,1]);
% PLECSplot(Plot(3), Options)

% linkaxes(axes, 'x') % Options: x, y, xy, off


%% SAVE
plot2file(fig1, Options, ImageTitle);