clc
clear
close all

filename ="TorqueSpeed";

warning('on','all')
warning

debugmode(true)

outputmode(true)

%% Load Data 

DATA = getData(filename);

%% Plot parameter definition
Options = plotOptions_V2();

%% PLOT TO FILE
ImageTitle = "SpeedTorque";

%% PLOT 1
Plot(1).Title.String = "Electromechanical Speed";

Plot(1).Legend.String = {'Reference', 'Actual'};
Plot(1).Legend.Location = 'NorthEast';
Plot(1).Legend.NumColumns = 1;

% Plot(1).Vline(1).X = 0.45;
% Plot(1).Vline(1).Y = [-10 1000];
% Plot(1).Vline(2).X = 0.5;
% Plot(1).Vline(2).Y = [-10 1000];
% 
% Plot(1).Vline(1).Style.Color = "red";
% 
% Plot(1).Hline(1).X = [0 0.6];
% Plot(1).Hline(1).Y = 100;
% Plot(1).Hline(2).X = [0 0.6];
% Plot(1).Hline(2).Y = 1000;

% Plot(1).Trace(1).Style.Color = Options.Color.Red;
% Plot(1).Trace(2).Style.Color = Options.Color.Blue;
% 
% 
% Plot(1).Trace(1).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(1).Trace(2).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(1).Trace(3).Style.LineStyle = Options.LineStyle.Dashed;
% 
% Plot(1).Trace(1).Style.Marker = Options.Marker.Ast;
% Plot(1).Trace(2).Style.Marker = Options.Marker.Circle;
% Plot(1).Trace(3).Style.Marker = Options.Marker.Cross;


Plot(1).Trace(1).Y = DATA.Omega_meRef;
Plot(1).Trace(2).Y = DATA.Omega_meActual;
Plot(1).Trace(1).X = DATA.Time;
Plot(1).Trace(2).X = Plot(1).Trace(1).X;

Plot(1).YLabel.String= "Speed [rad/s]";
Plot(1).XLabel.String = '';
Plot(1).Axis.XTickLabel = '';
Plot(1).Axis.YLim = [-50 1500];
Plot(1).Axis.XLim = [0 0.8];
Plot(1).Axis.XScale = 'linear';
Plot(1).Axis.YScale = 'linear';

%% PLOT 2
Plot(2).Title.String = "Electromechanical Torque";

Plot(2).Legend.String = {'Reference', 'Actual', 'Load'};
Plot(2).Legend.Location = 'NorthEast';
Plot(2).Legend.NumColumns = 1;
% Plot(2).Legend.Tag = "testtag";


Plot(2).Trace(1).Style.Color = Options.Color.Blue;
% Plot(2).Trace(2).Style.Color = Options.Color.Blue;
% Plot(2).Trace(3).Style.Color = Options.Color.Green;

% Plot(2).Trace(1).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(2).Trace(2).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(2).Trace(3).Style.LineStyle = Options.LineStyle.Dashed;
% 
% Plot(2).Trace(1).Style.Marker = Options.Marker.Ast;
% Plot(2).Trace(2).Style.Marker = Options.Marker.Circle;
% Plot(2).Trace(3).Style.Marker = Options.Marker.Circle;


Plot(2).Trace(1).Y = DATA.TemRef;
Plot(2).Trace(2).Y = DATA.TemActual;
Plot(2).Trace(3).Y = DATA.Tload;
Plot(2).Trace(1).X = DATA.Time;
Plot(2).Trace(2).X = DATA.Time;
Plot(2).Trace(3).X = DATA.Time;

Plot(2).Axis.YTick = [0 20 40 60];
Plot(2).Axis.YLim = [-5 65];
Plot(2).Axis.XLimit = [0.05 0.8];

Plot(2).Axis.XScale = 'linear';
% Plot(2).Axis.YScale = 'log';

% Plot(2).Axis.Tag = "testtag";
Plot(2).YLabel.String = "Torque [Nm]";
Plot(2).XLabel.String = 'Time [s]';
% Plot(2).YLabel.Tag = "testtag";
% Plot(2).XLabel.Tag = "testtag";


% Note(1).Type = 'textbox';
% Note(1).XPosition = [0.3 0.6];
% Note(1).YPosition = [60 40];
% Note(1).Text  = 'test array';
% 
% 
% Note(1).Style.FitBoxToText  = 'on';
% Note(1).Style.LineStyle  = 'none';
% Note(1).Style.Color  = 'Red';


Note(1).Type = 'rectangle';
Note(1).XPosition = [0.1 0.6];
Note(1).YPosition = [50 40];
Note(1).Text  = 'test array';
Note(1).Style.LineStyle  = '-.';
Note(1).Style.LineWidth  = 5;
Note(1).Style.Color  = 'blue';
Note(1).Style.FaceColor = 'red';
Note(1).Style.FaceAlpha = .2;
Note(1).Style.LineStyle = ':';


% % Note(3).Family = 3;
% Note(3).Type = 'textarrow';
% Note(3).XPosition = [0.6 0.3];
% Note(3).YPosition = [30 60];
% Note(3).Text  = 'test array arrow';
% Note(3).Style.LineStyle  = '--';
% Note(3).Style.Color  = 'red';


Plot(2).Note = Note;

t = (1/16:1/8:1)'*2*pi;

Plot(2).Fill(1).X = 0.5*cos(t);
Plot(2).Fill(1).Y = 10*sin(t)+10;
%Plot(2).Fill(1).Color = [0.8 0.7 0.8];
Plot(2).Fill(1).Style.FaceColor = [0.8 0.7 1];
Plot(2).Fill(1).Style.FaceAlpha = .5;
Plot(2).Fill(1).Style.LineStyle = ':';

Plot(2).Fill(2).X = 0.5*cos(t);
Plot(2).Fill(2).Y = 10*sin(t)+10;
%Plot(2).Fill(1).Color = [0.8 0.7 0.8];
Plot(2).Fill(2).Style.FaceColor = [0.8 0.7 1];


%% PLOT
fig1 = figure('Name', ImageTitle, 'WindowState', 'maximized'); 
drawnow;
t = tiledlayout(length(Plot),1,'Padding','compact','TileSpacing','compact');
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];

for i=1:length(Plot)
  nexttile;
  PLECSplot(Plot(i), Options)
end

%% SAVE
plot2file(fig1, Options, ImageTitle);