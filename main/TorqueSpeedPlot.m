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
Options = plotOptions();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "Speed and torque";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Electrical Speed";
Plot1.Ylabel = "Speed [rad/s]";
Plot1.Xlabel = '';
Plot1.Legend = {'Reference', 'Actual'};
Plot1.LocationLegend = 'NorthEast';
Plot1.NumColumns = 1;
Plot1.Datay = [DATA.Omega_meRef, DATA.Omega_meActual];
Plot1.Datax = [DATA.Time DATA.Time];
Plot1.XTickLabel = '';

%% PLOT 2
Plot2.FigureTitle = "Electromechanical Torque";
Plot2.Ylabel = "Torque [Nm]";
Plot2.Xlabel = 'Time [ms]';
Plot2.Legend = {'Reference', 'Actual', 'Load'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;
Plot2.Datay = [DATA.TemRef DATA.TemActual DATA.Tload];
Plot2.Datax = [DATA.Time DATA.Time, DATA.Time];


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