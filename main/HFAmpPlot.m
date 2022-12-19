clc
clear
close all

filename ="HFamp";

warning('on','all')
warning

debugmode(true)

outputmode(true)

%% Load Data 

DATA = getData(filename);

%% Plot parameter definition
Options = plotOptions_V2();

%% PLOT TO FILE
ImageTitle = "HFampnew";

%% PLOT 1
Plot(1).Title.String = "High-Frequency Injection Voltage Amplitude";

Plot(1).Legend.String = "";
Plot(1).Legend.Style.Location = 'NorthEast';
Plot(1).Legend.Style.NumColumns = 1;

Plot(1).Vline(1).X = 0.01;
Plot(1).Vline(1).Y = [-100 1500];
Plot(1).Vline(2).X = 0.1;
Plot(1).Vline(2).Y = [-100 1500];
Plot(1).Vline(3).X = 0.2;
Plot(1).Vline(3).Y = [-100 1500];
Plot(1).Vline(4).X = 0.25;
Plot(1).Vline(4).Y = [-100 1500];
Plot(1).Vline(5).X = 0.3;
Plot(1).Vline(5).Y = [-100 1500];
Plot(1).Vline(6).X = 0.4;
Plot(1).Vline(6).Y = [-100 1500];
Plot(1).Vline(7).X = 0.5;
Plot(1).Vline(7).Y = [-100 1500];
Plot(1).Vline(8).X = 0.7;
Plot(1).Vline(8).Y = [-100 1500];
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


Plot(1).Trace(1).Y = DATA.UhxAmp;

Plot(1).Trace(1).X = DATA.Time;

Plot(1).YLabel.String= "Voltage [V]";
Plot(1).XLabel.String = '';
Plot(1).Axis.XTickLabel = '';
Plot(1).Axis.YLim = [-0 150];
Plot(1).Axis.XLim = [0 0.8];
Plot(1).Axis.XScale = 'linear';
Plot(1).Axis.YScale = 'linear';

%% PLOT 2
Plot(2).Title.String = "High-Frequency Injection Current Amplitude";

Plot(2).Legend.String = {'Phase A', 'Phase B', 'Phase C'};
Plot(2).Legend.Style.Location = 'NorthEast';
Plot(2).Legend.Style.NumColumns = 1;
% Plot(2).Legend.Tag = "testtag";


% Plot(2).Trace(1).Style.Color = Options.Color.Blue;
% Plot(2).Trace(2).Style.Color = Options.Color.Blue;
% Plot(2).Trace(3).Style.Color = Options.Color.Green;

% Plot(2).Trace(1).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(2).Trace(2).Style.LineStyle = Options.LineStyle.Dashed;
% Plot(2).Trace(3).Style.LineStyle = Options.LineStyle.Dashed;
% 
% Plot(2).Trace(1).Style.Marker = Options.Marker.Ast;
% Plot(2).Trace(2).Style.Marker = Options.Marker.Circle;
% Plot(2).Trace(3).Style.Marker = Options.Marker.Circle;


Plot(2).Trace(1).Y = DATA.IhaAmp;
Plot(2).Trace(2).Y = DATA.IhbAmp;
Plot(2).Trace(3).Y = DATA.IhcAmp;
Plot(2).Trace(1).X = DATA.Time;
Plot(2).Trace(2).X = DATA.Time;
Plot(2).Trace(3).X = DATA.Time;

Plot(2).Vline(1).X = 0.01;
Plot(2).Vline(1).Y = [-150 1500];
Plot(2).Vline(2).X = 0.1;
Plot(2).Vline(2).Y = [-150 1500];
Plot(2).Vline(3).X = 0.2;
Plot(2).Vline(3).Y = [-150 1500];
Plot(2).Vline(4).X = 0.25;
Plot(2).Vline(4).Y = [-150 1500];
Plot(2).Vline(5).X = 0.3;
Plot(2).Vline(5).Y = [-150 1500];
Plot(2).Vline(6).X = 0.4;
Plot(2).Vline(6).Y = [-150 1500];
Plot(2).Vline(7).X = 0.5;
Plot(2).Vline(7).Y = [-150 1500];
Plot(2).Vline(8).X = 0.7;
Plot(2).Vline(8).Y = [-150 1500];

Plot(2).Axis.YTick = [-125  -75  -25  25  75  125];
Plot(2).Axis.YLim = [-130 130];
Plot(2).Axis.XLim = [0 0.8];

Plot(2).Axis.XScale = 'linear';
% Plot(2).Axis.YScale = 'log';

% Plot(2).Axis.Tag = "testtag";
Plot(2).YLabel.String = "Current [A]";
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


% Note(1).Type = 'rectangle';
% Note(1).XPosition = [0.1 0.6];
% Note(1).YPosition = [50 40];
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

t = (1/16:1/8:1)'*2*pi;

% Plot(2).Fill(1).X = 0.5*cos(t);
% Plot(2).Fill(1).Y = 10*sin(t)+10;
% %Plot(2).Fill(1).Color = [0.8 0.7 0.8];
% Plot(2).Fill(1).Style.FaceColor = [0.8 0.7 1];
% Plot(2).Fill(1).Style.FaceAlpha = .5;
% Plot(2).Fill(1).Style.LineStyle = ':';
% 
% Plot(2).Fill(2).X = 0.5*cos(t);
% Plot(2).Fill(2).Y = 10*sin(t)+10;
% %Plot(2).Fill(1).Color = [0.8 0.7 0.8];
% Plot(2).Fill(2).Style.FaceColor = [0.8 0.7 1];


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



















% clc
% clear
% close all
% 
% filenameMAT = "..\Data\HFamp.mat";
% filenameCSV = "..\CSV\HFamp.csv";
% 
% if exist(filenameMAT) == 2 %se esiste lo carico
%    disp ('File exsits!');
%    load(filenameMAT)
% else % se no lo devo importare 
%    disp ('File NOT found');
%    DATA = importfileHFamp(filenameCSV);
%    metadata = dir(filenameCSV);
%    save(filenameMAT, 'metadata', 'DATA');
% end
% 
% if (metadata.bytes ~= dir(filenameCSV).bytes)
%    disp ('File is Obsolete');
%    DATA = importfileHFamp(filenameCSV);
%    metadata = dir(filenameCSV)
%    save(filenameMAT, 'metadata', 'DATA');
% end
% 
% %% Definizione parametri plot
% Options = plotOptions();
% 
% %% PLOT TO FILE
% DirectoryFigure = "..\Fig\";
% ImageTitle = "High-Frequency Injection Amplitudes";
% ImageTitle = DirectoryFigure+ImageTitle;
% 
% %% PLOT 1
% Plot1.FigureTitle = "High-Frequency Injection Voltage Amplitude";
% Plot1.Ylabel = "Voltage [V]";
% Plot1.Xlabel = '';
% Plot1.Legend = {'HF Voltage'};
% Plot1.LocationLegend = 'NorthEast';
% Plot1.NumColumns = 1;
% Plot1.Datay = [DATA.UhxAmp];
% Plot1.Datax = [DATA.Time];
% Plot1.XTickLabel = '';
% Plot1.XLim = [0 0.8];
% 
% %% PLOT 2
% Plot2.FigureTitle = "High-Frequency Injection Current Amplitude";
% Plot2.Ylabel = "Current [A]";
% Plot2.Xlabel = 'Time [s]';
% Plot2.Legend = {'HF Current Phase A', 'HF Current Phase B', 'HF Current Phase C'};
% Plot2.LocationLegend = 'NorthEast';
% Plot2.NumColumns = 1;
% Plot2.Datay = [DATA.IhaAmp DATA.IhbAmp DATA.IhcAmp];
% Plot2.Datax = [DATA.Time DATA.Time, DATA.Time];
% Plot2.XLim = [0 0.8];
% 
% 
% %% PLOT
% figure1 = figure(1);
% t = tiledlayout(2,1,'Padding','compact','TileSpacing','compact');
% t.Units = Options.Units;
% t.OuterPosition = [0 0 Options.Width Options.Height];
% nexttile;
% PLECSplot(Plot1, Options)
% nexttile;
% PLECSplot(Plot2, Options)
% 
% set(gcf, 'WindowState', 'maximized');
% 
% %% SAVE
% plot2file(figure1, Options, ImageTitle);