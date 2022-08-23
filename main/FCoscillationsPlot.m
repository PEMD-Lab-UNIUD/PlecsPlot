clc
clear
close all
filenameMAT = "..\Data\CFoscillations.mat";

if exist(filenameMAT) == 2
   disp('File exsits!');
   load(filenameMAT)
else
   disp('File NOT found');
%   filenameCSV = "..\CSV\cap.csv";
    filenameCSV = "..\CSV\cfc_osc.csv";
   DATA = importfileCF(filenameCSV);
   save(filenameMAT);
end

%% Definizione parametri plot
Options = plotOptions();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "Flying Capacitor Oscillations";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Flying Capacitor Current Oscillations Amplitude";
Plot1.Ylabel = "Current [A]";
Plot1.Xlabel = '';
Plot1.XTickLabel = '';
Plot1.Datay = [DATA.Icfa DATA.Icfb DATA.Icfc];
Plot1.Datax = [DATA.Time DATA.Time DATA.Time];
Plot1.XLim = [0.472 0.55];
Plot1.YLim = [-60 60];
% Plot1.Vline = [0.1 0.25];
% Plot1.VlineLim = [90 110];
% Plot1.Hline = [95 105];
% Plot1.HlineLim = [0 0.6];
Plot1.Legend = {'FC Current Phase A', 'FC Current Phase B', 'FC Current Phase C'};
Plot1.LocationLegend = 'NorthEast';
Plot1.NumColumns = 1;

%% PLOT 2
Plot2.FigureTitle = "Flying Capacitor Voltage Oscillations Amplitude";
Plot2.Ylabel = "Voltage [V]";
Plot2.Xlabel = 'Time [ms]';
% Plot2.XTick = [0.475 0.55];
% Plot2.XTickLabel = {'$t_0$','ciao'};
Plot2.Datay = [DATA.Vcfa DATA.Vcfb DATA.Vcfc];
Plot2.Datax = [DATA.Time DATA.Time DATA.Time];
Plot2.XLim = [0.472 0.55];
Plot2.YLim = [-350 350];
% Plot2.Vline = [0.1 0.25];
% Plot2.VlineLim = [90 110];
% Plot2.Hline = [95 105];
% Plot2.HlineLim = [0 0.6];
Plot2.Legend = {'FC Voltage Phase A', 'FC Voltage Phase B', 'FC Voltage Phase C'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;


%% PLOT
figure1 = figure(1);
t = tiledlayout(2,1,'Padding','compact','TileSpacing','compact');
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];
nexttile;
PLECSplot(Plot1, Options)
nexttile;
PLECSplot(Plot2, Options)

set(gcf, 'WindowState', 'maximized');

%% SAVE
plot2file(figure1, Options, ImageTitle);