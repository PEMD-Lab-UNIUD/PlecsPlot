clc
clear
close all
filenameMAT = "..\Data\SM_startup_dec10.mat";

if exist(filenameMAT) == 2 
   disp('File exsits!');
   load(filenameMAT)
else
   disp('File NOT found');
   filenameCSV = "..\CSV\SM_startup_dec10.csv";
%     filenameCSV = "..\SM_startup.csv";
   DATA = importfileSMstartup(filenameCSV);
   save(filenameMAT);
end

%% Definizione parametri plot
Options = plotOptions();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "SMCapacitorAmplitudes startup";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Phase A - SMs Voltage Amplitude";
Plot1.Ylabel = "Voltage [V]";
Plot1.Xlabel = '';
Plot1.XTickLabel = '';
Plot1.Datay = [DATA.SMa1, DATA.SMa2, DATA.SMa3, DATA.SMa4, DATA.SMa5, DATA.SMa6, DATA.SMa7, DATA.SMa8, DATA.SMa9, DATA.SMa10, DATA.SMa11, DATA.SMa12, DATA.SMa13, DATA.SMa14, DATA.SMa15, DATA.SMa16];
Plot1.Datax = [DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time];
Plot1.XLim = [0 8];
Plot1.YLim = [0 110];
Plot1.Vline = [0.45 1.05 1.9];
Plot1.VlineLim = [0 110];
% Plot1.Hline = [95 105];
% Plot1.HlineLim = [0 0.8];

%% PLOT 2
Plot2.FigureTitle = "Phase B - SMs Voltage Amplitude";
Plot2.Ylabel = "Voltage [V]";
Plot2.Xlabel = '';
Plot2.XTickLabel = '';
Plot2.Datay = [DATA.SMb1, DATA.SMb2, DATA.SMb3, DATA.SMb4, DATA.SMb5, DATA.SMb6, DATA.SMb7, DATA.SMb8, DATA.SMb9, DATA.SMb10, DATA.SMb11, DATA.SMb12, DATA.SMb13, DATA.SMb14, DATA.SMb15, DATA.SMb16];
Plot2.Datax = [DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time];
Plot2.XLim = [0 8];
Plot2.YLim = [0 110];
Plot2.Vline = [0.45 1.9 2.55 3.4];
Plot2.VlineLim = [0 110];
% Plot2.Hline = [95 105];
% Plot2.HlineLim = [0 0.8];

%% PLOT 3
Plot3.FigureTitle = "Phase C - SMs Voltage Amplitude";
Plot3.Ylabel = "Voltage [V]";
Plot3.Xlabel = 'Time [s]';
% Plot3.XTickLabel = '';
Plot3.Datay = [DATA.SMc1, DATA.SMc2, DATA.SMc3, DATA.SMc4, DATA.SMc5, DATA.SMc6, DATA.SMc7, DATA.SMc8, DATA.SMc9, DATA.SMc10, DATA.SMc11, DATA.SMc12, DATA.SMc13, DATA.SMc14, DATA.SMc15, DATA.SMc16];
Plot3.Datax = [DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time DATA.Time];
Plot3.XLim = [0 8];
Plot3.YLim = [0 110];
Plot3.Vline = [0.45 3.4  4 4.9];
Plot3.VlineLim = [0 110];
% Plot3.Hline = [95 105];
% Plot3.HlineLim = [0 0.8];

%% PLOT
figure1 = figure(1);
t = tiledlayout(3,1,'Padding','compact','TileSpacing','compact');
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];
nexttile;
PLECSplot(Plot1, Options)
nexttile;
PLECSplot(Plot2, Options)
nexttile;
PLECSplot(Plot3, Options)

set(gcf, 'WindowState', 'maximized');

%% SAVE
plot2file(figure1, Options, ImageTitle);