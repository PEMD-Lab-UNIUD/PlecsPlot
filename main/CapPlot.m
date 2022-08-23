clc
clear
close all
filenameMAT = "..\Data\cap.mat";

if exist(filenameMAT) == 2
   disp('File exsits!');
   load(filenameMAT)
else
   disp('File NOT found');
%   filenameCSV = "..\CSV\cap.csv";
    filenameCSV = "..\cap.csv";
   DATA = importfileCap(filenameCSV);
   save(filenameMAT);
end

%% Definizione parametri plot
Options = plotOptions();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "CapAmplitudes";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Phase A - upper Sub-arm upper Arm SMs Voltage Amplitude";
Plot1.Ylabel = "Voltage [V]";
Plot1.Xlabel = '';
Plot1.XTickLabel = '';
Plot1.Datay = [DATA.Cap1 DATA.Cap2 DATA.Cap3 DATA.Cap4];
Plot1.Datax = [DATA.Time DATA.Time DATA.Time DATA.Time];
Plot1.XLim = [0 0.8];
Plot1.YLim = [90 110];
% Plot1.Vline = [0.1 0.25];
% Plot1.VlineLim = [90 110];
% Plot1.Hline = [95 105];
% Plot1.HlineLim = [0 0.8];

%% PLOT 2
Plot2.FigureTitle = "Phase A - lowrer Sub-arm upper Arm SMs Voltage Amplitude";
Plot2.Ylabel = "Voltage [V]";
Plot2.Xlabel = '';
Plot2.XTickLabel = '';
Plot2.Datay = [DATA.Cap5 DATA.Cap6 DATA.Cap7 DATA.Cap8];
Plot2.Datax = [DATA.Time DATA.Time DATA.Time DATA.Time];
Plot2.XLim = [0 0.8];
Plot2.YLim = [90 110];
% Plot2.Vline = [0.1 0.25];
% Plot2.VlineLim = [90 110];
% Plot2.Hline = [95 105];
% Plot2.HlineLim = [0 0.8];

%% PLOT 3
Plot3.FigureTitle = "Phase A - upper Sub-arm lower Arm SMs Voltage Amplitude";
Plot3.Ylabel = "Voltage [V]";
Plot3.Xlabel = '';
Plot3.XTickLabel = '';
Plot3.Datay = [DATA.Cap9 DATA.Cap10 DATA.Cap11 DATA.Cap12];
Plot3.Datax = [DATA.Time DATA.Time  DATA.Time  DATA.Time];
Plot3.XLim = [0 0.8];
Plot3.YLim = [90 110];
% Plot3.Vline = [0.1 0.25];
% Plot3.VlineLim = [90 110];
% Plot3.Hline = [95 105];
% Plot3.HlineLim = [0 0.8];

%% PLOT 4
Plot4.FigureTitle = "Phase A - lower Sub-arm lower Arm SMs Voltage Amplitude";
Plot4.Ylabel = "Voltage [V]";
Plot4.Xlabel = 'Time [ms]';
Plot4.Datay = [DATA.Cap13 DATA.Cap14 DATA.Cap15 DATA.Cap16];
Plot4.Datax = [DATA.Time  DATA.Time  DATA.Time  DATA.Time];
Plot4.XLim = [0 0.8];
Plot4.YLim = [90 110];
% Plot4.Vline = [0.1 0.25];
% Plot4.VlineLim = [90 110];
% Plot4.Hline = [95 105];
% Plot4.HlineLim = [0 0.8];

%% PLOT
figure1 = figure(1);
t = tiledlayout(4,1,'Padding','compact','TileSpacing','compact');
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];
nexttile;
PLECSplot(Plot1, Options)
nexttile;
PLECSplot(Plot2, Options)
nexttile;
PLECSplot(Plot3, Options)
nexttile;
PLECSplot(Plot4, Options)



%% SAVE
set(gcf, 'WindowState', 'maximized');
plot2file(figure1, Options, ImageTitle);