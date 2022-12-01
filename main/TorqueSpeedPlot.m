clc
clear
close all
filenameMAT = "..\Data\TorqueSpeed.mat";

if exist(filenameMAT) == 2
   disp ('File exsits!');
   load(filenameMAT)
else
   disp ('File NOT found');
   filenameCSV = "..\CSV\TorqueSpeed.csv";
   DATA = importfileTorqueSpeed(filenameCSV);
   save(filenameMAT);
end

%% Definizione parametri plot
Options = plotOptions_V2();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "Speed and torque";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Electromechanical Speed";
Plot1.Ylabel = "Speed [rad/s]";
Plot1.Xlabel = '';
Plot1.Legend = {'Reference', 'Actual'};
Plot1.LocationLegend = 'NorthEast';
Plot1.NumColumns = 1;
Plot1.Datay = [DATA.Omega_meRef, DATA.Omega_meActual];
Plot1.Datax = [DATA.Time DATA.Time];
Plot1.XTickLabel = '';
Plot1.YLim = [-50 1500];
Plot1.XLim = [0 0.8];

%% PLOT 2
Plot2.FigureTitle = "Electromechanical Torque";
Plot2.Ylabel = "Torque [Nm]";
Plot2.Xlabel = 'Time [s]';
Plot2.Legend = {'Reference', 'Actual', 'Load'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;
Plot2.Datay = [DATA.TemRef DATA.TemActual DATA.Tload];
Plot2.Datax = [DATA.Time DATA.Time, DATA.Time];
Plot2.YTick = [0 20 40 60];
Plot2.YLim = [-5 65];
Plot2.XLim = [0 0.8];


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
plot2file(figure1, Options, "test");