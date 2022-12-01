clc
clear all
close all
filenameMAT = "..\Data\currents_startup.mat";

if exist(filenameMAT) == 2
   disp ('File exsits!');
   load(filenameMAT)
else
   disp ('File NOT found');
   filenameCSV = "..\CSV\currents_startup.csv";
   DATA = importfileCurrents(filenameCSV);
   save(filenameMAT);
end

%% Definizione parametri plot
Options = plotOptions();
Number_of_plots = 2;

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "Currents_startup";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Synchronous Reference Frame $d$-axis";
Plot1.Ylabel = "Current [A]";
Plot1.Xlabel = '';
Plot1.Legend = {'Reference', 'Actual'};
Plot1.LocationLegend = 'NorthEast';
Plot1.NumColumns = 1;
Plot1.Datay = [DATA.Idref DATA.Id];
Plot1.Datax = [DATA.Time DATA.Time];
Plot1.XLim = [0 8];
Plot1.YLim = [-1 1];
Plot1.XTickLabel = '';

%% PLOT 2
Plot2.FigureTitle = "Synchronous Reference Frame $q$-axis";
Plot2.Ylabel = "Current [A]";
Plot2.Xlabel = 'Time [s]';
Plot2.Legend = {'Reference', 'Actual'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;
Plot2.XLim = [0 8];
Plot2.YLim = [-1 1];
Plot2.Datay = [DATA.Iqref DATA.Iq];
Plot2.Datax = [DATA.Time DATA.Time];
% Plot2.XTickLabel = '';


%% PLOT
figure1 = figure(1);
t = tiledlayout(Number_of_plots,1,'Padding','compact','TileSpacing','compact');
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];
nexttile;
PLECSplot(Plot1, Options)
nexttile;
PLECSplot(Plot2, Options)

set(gcf, 'WindowState', 'maximized');


%% SAVE
plot2file(figure1, Options, ImageTitle);