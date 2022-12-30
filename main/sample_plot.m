clc
clear
close all

% filename ="TorqueSpeed";

warning('on','all')                                         % to disply the warnings
debugmode(true)                                             % to enable console output for debug purposes
save2filemode(false)                                        % to save the plot on file

%% Layout settings

nrows = 4;
ncols = 4;
fullcols = ncols;
halfcols = fullcols/2;
fullrows = nrows;
halfrows = fullrows/2;


%% Data to plot

x = linspace(0,10,100);

y1 = sin(x);
y2 = sin(2*x);
y3 = cos(3*x);
y4 = cos(4*x);


%% Plot parameter definition
Options = plotOptions_V2();

%% Set image title
ImageTitle = "sample";

%% PLOT 1 definition 

Plot(1).Layout = [halfrows halfcols];                                     % this is crucial to set the subplot appearance

Plot(1).Title.String = "Example Title";

Plot(1).Legend.String = {'Example Legend entry 1', '', 'Example Lengend entry 3'};  % Leave an empty string to skip a trace in the legend
Plot(1).Legend.Style.Location = 'east';
Plot(1).Legend.Style.NumColumns = 1;

Plot(1).Vline(1).X = 0.01;                                  % Example of unlimited vertical line
Plot(1).Vline(1).Style.Color = "red";
Plot(1).Vline(2).X = 0.1;                                   % Example of limited vertical line
Plot(1).Vline(2).Y = [-100 1500];
                       
Plot(1).Hline(1).X = [0 0.6];                               % Example of limited horizontal line
Plot(1).Hline(1).Y = 0.5;

% traces array to specify the different traces in the same plot

Plot(1).Trace(1).Y = y1;
Plot(1).Trace(2).Y = y2;
Plot(1).Trace(3).Y = y3;
Plot(1).Trace(1).X = x;
Plot(1).Trace(2).X = x;
Plot(1).Trace(3).X = x;

% style options for traces see matlab official documentation for the various options

% Plot(1).Trace(1).Style.Color = Options.Color.Red;
% Plot(1).Trace(2).Style.Color = Options.Color.Blue;

% Plot(1).Trace(1).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(1).Trace(2).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(1).Trace(3).Style.LineStyle = Options.LineStyle.Dashed;

% Plot(1).Trace(1).Style.Marker = Options.Marker.Ast;
% Plot(1).Trace(2).Style.Marker = Options.Marker.Circle;
Plot(1).Trace(3).Style.Marker = Options.Marker.Cross;
Plot(1).Trace(3).Style.MarkerSize = 20;


% axis options

Plot(1).YLabel.String= "Sample Ylabel";
Plot(1).XLabel.String = '';
% Plot(1).Axis.XTickLabel = '';
Plot(1).Axis.YLim = [ ];
Plot(1).Axis.XLim = [ ];
Plot(1).Axis.XLim = [1 9];
Plot(1).Axis.XScale = 'linear';
Plot(1).Axis.YScale = 'linear';
Plot(1).Axis.XGrid = 'on';
Plot(1).Axis.YGrid = 'on';
Plot(1).Axis.XMinorGrid = 'on';
Plot(1).Axis.YMinorGrid = 'on';

%% PLOT 2
Plot(2).Layout = [fullrows halfcols];
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

Plot(2).Axis.XLim = [1 9];

Plot(2).Zoom(1).X = [2 5];
Plot(2).Zoom(1).Y = [0.7 0];
Plot(2).Zoom(1).XPosition = [6 8];
Plot(2).Zoom(1).YPosition = [0.7 -0.5];

Plot(2).Axis.XGrid = 'on';
Plot(2).Axis.YGrid = 'on';



% Note(1).Type = 'textbox';
% Note(1).XPosition = [0.3 0.6];
% Note(1).YPosition = [60 40];
% Note(1).Text  = 'test array';
% 
% 
% Note(1).Style.FitBoxToText  = 'on';
% Note(1).Style.LineStyle  = 'none';
% Note(1).Style.Color  = 'Red';
% 
% 
% Note(1).Style.LineStyle  = '-.';
% Note(1).Style.LineWidth  = 5;
% Note(1).Style.Color  = 'blue';
% Note(1).Style.FaceColor = 'red';
% Note(1).Style.FaceAlpha = .2;
% Note(1).Style.LineStyle = ':';
% 
% 
% % Note(3).Family = 3;
% Note(3).Type = 'textarrow';
% Note(3).XPosition = [0.6 0.3];
% Note(3).YPosition = [30 60];
% Note(3).Text  = 'test array arrow';
% Note(3).Style.LineStyle  = '--';
% Note(3).Style.Color  = 'red';
% 
% 
% Plot(2).Note = Note;

time = (1/16:1/8:1)'*2*pi;

Plot(2).Fill(1).X = 2*cos(time)+3;
Plot(2).Fill(1).Y = sin(time);
Plot(2).Fill(1).Style.FaceColor = [0.8 0.7 1];
Plot(2).Fill(1).Style.FaceAlpha = .5;
Plot(2).Fill(1).Style.LineStyle = ':';


%% PLOT 3

Plot(3).Layout = [halfrows halfcols];
Plot(3).Title.String = "Example Title";

Plot(3).Legend.String = {'Example Legend 1st trace'};
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

Plot(3).Axis.XLim = [1 9];


Plot(3).Axis.XGrid = 'on';
Plot(3).Axis.YGrid = 'on';

%% Plot 4 space reserved for annotation
Plot(4).Rows = 1;
Plot(4).Columns = 1;
Plot(4).Layout = 'south';

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

Plot(4).Note(1).Type = 'textbox';
Plot(4).Note(1).Text = 'Space reserved for annotations outside the plot area';
Plot(4).Note(1).XPosition = [2 7];
Plot(4).Note(1).YPosition = [0.5 0];
Plot(4).Note(1).Style.FitBoxToText  = 'on';
Plot(4).Note(1).Style.Color  = 'Red';


%% PLOT
fig1 = figure('Name', ImageTitle, 'WindowState', 'maximized'); 
drawnow;

t = tiledlayout(nrows, ncols,'Padding','tight','TileSpacing','tight'); 
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];

for i=1:length(Plot)
  axes(i) = nexttile(t, Plot(i).Layout);
  PLECSplot(Plot(i), Options)
end

%% SAVE
plot2file(fig1, Options, ImageTitle);