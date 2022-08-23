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
ImageTitle = "Total";
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
Plot1.XLim = [0 0.8];

%% PLOT 2
Plot2.FigureTitle = "Electromechanical Torque";
Plot2.Ylabel = "Torque [Nm]";
Plot2.Xlabel = '';
Plot2.Legend = {'Reference', 'Actual', 'Load'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;
Plot2.Datay = [DATA.TemRef DATA.TemActual DATA.Tload];
Plot2.Datax = [DATA.Time DATA.Time, DATA.Time];
Plot2.XTickLabel = '';
Plot2.XLim = [0 0.8];

%% Change CSV

clear DATA
filenameMAT = "..\Data\currents.mat";

if exist(filenameMAT) == 2
   disp ('File exsits!');
   load(filenameMAT)
else
   disp ('File NOT found');
   filenameCSV = "..\CSV\currents.csv";
   DATA = importfileCurrents(filenameCSV);
   save(filenameMAT);
end

%% PLOT 3
Plot3.FigureTitle = "3-phase Stationary reference frame";
Plot3.Ylabel = "Current [A]";
Plot3.Xlabel = 'Time [ms]';
Plot3.Legend = {'Phase A', 'Phase B', 'Phase C'};
Plot3.LocationLegend = 'NorthEast';
Plot3.NumColumns = 1;
Plot3.Datay = [DATA.Ia DATA.Ib, DATA.Ic];
Plot3.Datax = [DATA.Time DATA.Time DATA.Time];
% Plot3.XTickLabel = '';
Plot3.XLim = [0 0.8];

%% Change CSV

clear DATA
filenameMAT = "..\Data\HFamp.mat";

if exist(filenameMAT) == 2
   disp ('File exsits!');
   load(filenameMAT)
else
   disp ('File NOT found');
   filenameCSV = "..\CSV\HFamp.csv";
   DATA = importfileCurrents(filenameCSV);
   save(filenameMAT);
end

%% PLOT 4
Plot4.FigureTitle = "High-Frequency Injection Voltage Amplitude";
Plot4.Ylabel = "Voltage [V]";
Plot4.Xlabel = '';
Plot4.Legend = {'HF Voltage'};
Plot4.LocationLegend = 'NorthEast';
Plot4.NumColumns = 1;
Plot4.Datay = [DATA.UhxAmp];
Plot4.Datax = [DATA.Time];
Plot4.XTickLabel = '';
Plot4.XLim = [0 0.8];

%% PLOT 5
Plot5.FigureTitle = "High-Frequency Injection Current Amplitude";
Plot5.Ylabel = "Current [A]";
Plot5.Xlabel = '';
Plot5.Legend = {'Phase A', 'Phase B', 'Phase C'};
Plot5.LocationLegend = 'NorthEast';
Plot5.NumColumns = 1;
Plot5.Datay = [DATA.IhaAmp DATA.IhbAmp DATA.IhcAmp];
Plot5.Datax = [DATA.Time DATA.Time, DATA.Time];
Plot5.XTickLabel = '';
Plot5.XLim = [0 0.8];


%% PLOT
figure1 = figure(1);
t = tiledlayout(3,1,'Padding','compact','TileSpacing','compact');
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];
nexttile;
PLECSplot(Plot1, Options)
nexttile;
PLECSplot(Plot2, Options)
% nexttile;
% PLECSplot(Plot4, Options)
% nexttile;
% PLECSplot(Plot5, Options)
nexttile;
PLECSplot(Plot3, Options)


set(gcf, 'WindowState', 'maximized');

%% SAVE
plot2file(figure1, Options, ImageTitle);
