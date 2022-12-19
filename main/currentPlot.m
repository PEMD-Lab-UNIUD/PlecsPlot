clc
clear
close all

filename ="currents";

warning('on','all')
warning

debugmode(true)

outputmode(true)

%% Load Data 

DATA = getData(filename);

%% Plot parameter definition
Options = plotOptions_V2();

%% PLOT TO FILE
ImageTitle = "currentsnew";

%% PLOT 1
Plot(1).Title.String = "Synchronous Reference Frame $d$-axis";

Plot(1).Legend.String = {'Reference', 'Actual'};
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

Plot(1).Trace(1).Y = DATA.Idref;
Plot(1).Trace(1).X = DATA.Time;
Plot(1).Trace(2).Y = DATA.Id;
Plot(1).Trace(2).X = DATA.Time;

Plot(1).YLabel.String= "Current [A]";
Plot(1).XLabel.String = '';
Plot(1).Axis.XTickLabel = '';
Plot(1).Axis.YLim = [-5 5];
Plot(1).Axis.XLim = [0 0.8];

%% PLOT 2
Plot(2).Title.String = "Synchronous Reference Frame $q$-axis";

Plot(2).Legend.String = {'Reference', 'Actual'};
Plot(2).Legend.Style.Location = 'NorthEast';
Plot(2).Legend.Style.NumColumns = 1;

Plot(2).Vline(1).X = 0.01;
Plot(2).Vline(1).Y = [-100 1500];
Plot(2).Vline(2).X = 0.1;
Plot(2).Vline(2).Y = [-100 1500];
Plot(2).Vline(3).X = 0.2;
Plot(2).Vline(3).Y = [-100 1500];
Plot(2).Vline(4).X = 0.25;
Plot(2).Vline(4).Y = [-100 1500];
Plot(2).Vline(5).X = 0.3;
Plot(2).Vline(5).Y = [-100 1500];
Plot(2).Vline(6).X = 0.4;
Plot(2).Vline(6).Y = [-100 1500];
Plot(2).Vline(7).X = 0.5;
Plot(2).Vline(7).Y = [-100 1500];
Plot(2).Vline(8).X = 0.7;
Plot(2).Vline(8).Y = [-100 1500];


Plot(2).Trace(1).Y = DATA.Iqref;
Plot(2).Trace(1).X = DATA.Time;
Plot(2).Trace(2).Y = DATA.Iq;
Plot(2).Trace(2).X = DATA.Time;

Plot(2).YLabel.String= "Current [A]";
Plot(2).XLabel.String = '';
Plot(2).Axis.XTickLabel = '';
Plot(2).Axis.YLim = [-5 85];
Plot(2).Axis.XLim = [0 0.8];

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

% t = (1/16:1/8:1)'*2*pi;

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

%% PLOT 3
Plot(3).Title.String = "3-phase Stationary Reference Frame";

Plot(3).Legend.String = {'Phase A', 'Phase B', 'Phase C'};
Plot(3).Legend.Style.Location = 'NorthEast';
Plot(3).Legend.Style.NumColumns = 1;

Plot(3).Vline(1).X = 0.01;
Plot(3).Vline(1).Y = [-100 1500];
Plot(3).Vline(2).X = 0.1;
Plot(3).Vline(2).Y = [-100 1500];
Plot(3).Vline(3).X = 0.2;
Plot(3).Vline(3).Y = [-100 1500];
Plot(3).Vline(4).X = 0.25;
Plot(3).Vline(4).Y = [-100 1500];
Plot(3).Vline(5).X = 0.3;
Plot(3).Vline(5).Y = [-100 1500];
Plot(3).Vline(6).X = 0.4;
Plot(3).Vline(6).Y = [-100 1500];
Plot(3).Vline(7).X = 0.5;
Plot(3).Vline(7).Y = [-100 1500];
Plot(3).Vline(8).X = 0.7;
Plot(3).Vline(8).Y = [-100 1500];


Plot(3).Trace(1).Y = DATA.Ia;
Plot(3).Trace(1).X = DATA.Time;
Plot(3).Trace(2).Y = DATA.Ib;
Plot(3).Trace(2).X = DATA.Time;
Plot(3).Trace(3).Y = DATA.Ic;
Plot(3).Trace(3).X = DATA.Time;

Plot(3).YLabel.String= "Current [A]";
Plot(3).XLabel.String = 'Time [s]';
% Plot(3).Axis.XTickLabel = '';
Plot(3).Axis.YLim = [-75 75];
Plot(3).Axis.XLim = [0 0.8];


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
% % % filenameMAT = "..\Data\currents.mat";
% % % 
% % % if exist(filenameMAT) == 2
% % %    disp ('File exsits!');
% % %    load(filenameMAT)
% % % else
% % %    disp ('File NOT found');
% % %    filenameCSV = "..\CSV\currents.csv";
% % %    DATA = importfileCurrents(filenameCSV);
% % %    save(filenameMAT);
% % % end
% 
% 
% %% Definizione parametri plot
% Options = plotOptions();
% 
% %% PLOT TO FILE
% DirectoryFigure = "..\Fig\";
% ImageTitle = "CurrentsCoupled";
% ImageTitle = DirectoryFigure+ImageTitle;
% 
% %% LOAD DATA
% 
%  filenameMAT = "..\Data\IdIqcoupled.mat";
% 
%  load(filenameMAT);
% 
% %% PLOT 1
% Plot1.FigureTitle = "Synchronous Reference Frame $d$-axis";
% Plot1.Ylabel = "Current [A]";
% Plot1.Xlabel = '';
% Plot1.Legend = {'Reference', 'Actual'};
% Plot1.LocationLegend = 'NorthEast';
% Plot1.NumColumns = 1;
% Plot1.Datay = [DATA.Idref DATA.Id];
% Plot1.Datax = [DATA.Times DATA.Times];
% Plot1.XTickLabel = '';
% Plot1.YLim = [-5 5];
% Plot1.XLim = [0 0.8];
% 
% %% PLOT 2
% Plot2.FigureTitle = "Synchronous Reference Frame $q$-axis";
% Plot2.Ylabel = "Current [A]";
% Plot2.Xlabel = '';
% Plot2.Legend = {'Reference', 'Actual'};
% Plot2.LocationLegend = 'NorthEast';
% Plot2.NumColumns = 1;
% Plot2.Datay = [DATA.Iqref DATA.Iq];
% Plot2.Datax = [DATA.Times DATA.Times];
% Plot2.XTickLabel = '';
% Plot2.YLim = [-10 80];
% Plot2.XLim = [0 0.8];
% 
% %% LOAD DATA
% 
% clear DATA
%  filenameMAT = "..\Data\accoupled.mat";
% 
%  load(filenameMAT);
% 
% %% PLOT 2
% Plot3.FigureTitle = "3-phase Stationary Reference Frame";
% Plot3.Ylabel = "Current [A]";
% Plot3.Xlabel = 'Time [s]';
% Plot3.Legend = {'Phase A', 'Phase B', 'Phase C'};
% Plot3.LocationLegend = 'NorthEast';
% Plot3.NumColumns = 1;
% Plot3.Datay = [DATA.Ia DATA.Ib, DATA.Ic];
% Plot3.Datax = [DATA.Times DATA.Times DATA.Times];
% % Plot3.XTickLabel = ;
% Plot3.YLim = [-80 80];
% Plot3.XLim = [0 0.8];
% 
% 
% 
% %% PLOT
% figure1 = figure(1);
% t = tiledlayout(3,1,'Padding','compact','TileSpacing','compact');
% t.Units = Options.Units;
% t.OuterPosition = [0 0 Options.Width Options.Height];
% nexttile;
% PLECSplot_old(Plot1, Options)
% nexttile;
% PLECSplot_old(Plot2, Options)
% nexttile;
% PLECSplot_old(Plot3, Options)
% 
% set(gcf, 'WindowState', 'maximized');
% 
% %% SAVE
% % plot2file(figure1, Options, ImageTitle);