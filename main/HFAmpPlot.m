clc
clear
close all

filenameMAT = "..\Data\HFamp.mat";
filenameCSV = "..\CSV\HFamp.csv";

if exist(filenameMAT) == 2 %se esiste lo carico
   disp ('File exsits!');
   load(filenameMAT)
else % se no lo devo importare 
   disp ('File NOT found');
   DATA = importfileHFamp(filenameCSV);
   metadata = dir(filenameCSV)
   save(filenameMAT, 'metadata', 'DATA');
end

if (metadata.bytes ~= dir(filenameCSV).bytes)
   disp ('File is Obsolete');
   DATA = importfileHFamp(filenameCSV);
   metadata = dir(filenameCSV)
   save(filenameMAT, 'metadata', 'DATA');
end

%% Definizione parametri plot
Options = plotOptions();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "High-Frequency Injection Amplitudes";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "High-Frequency Injection Voltage Amplitude";
Plot1.Ylabel = "Voltage [V]";
Plot1.Xlabel = '';
Plot1.Legend = {'HF Voltage'};
Plot1.LocationLegend = 'NorthEast';
Plot1.NumColumns = 1;
Plot1.Datay = [DATA.UhxAmp];
Plot1.Datax = [DATA.Time];
Plot1.XTickLabel = '';

%% PLOT 2
Plot2.FigureTitle = "High-Frequency Injection Current Amplitude";
Plot2.Ylabel = "Current [A]";
Plot2.Xlabel = 'Time [ms]';
Plot2.Legend = {'HF Current Phase A', 'HF Current Phase B', 'HF Current Phase C'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;
Plot2.Datay = [DATA.IhaAmp DATA.IhbAmp DATA.IhcAmp];
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