clc
clear
close all
file1 = "cap_old";
file2 = "cap_old";

DATA1 = csv2mat(file1);
DATA2 = csv2mat(file2);

% filenameMAT_1 = "..\Data\cap.mat";
% filenameMAT_2 = "..\Data\cap_old.mat";
% filenameCSV_1 = "..\CSV\cap.csv";
% filenameCSV_2 = "..\CSV\cap_old.csv";
% 
% if exist(filenameMAT_1) == 2
%    disp('File exsits!');
%    load(filenameMAT_1)
% else
%    disp('File NOT found');
%     DATA = importfileCap(filenameCSV);
%     metadata = dir(filenameCSV_1);
%     save(filenameMAT_1, 'metadata', 'DATA');
% end
% 
% if (metadata.bytes ~= dir(filenameCSV).bytes)
%    disp ('File is Obsolete');
%    DATA = importfileCap(filenameCSV);
%    metadata = dir(filenameCSV)
%    save(filenameMAT, 'metadata', 'DATA');
% end

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
Plot1.Datay = [DATA1.Cap1, DATA1.Cap2, DATA1.Cap3, DATA1.Cap4, DATA2.Cap1, DATA2.Cap2, DATA2.Cap3, DATA2.Cap4];
Plot1.Datax = [DATA1.Time, DATA1.Time, DATA1.Time, DATA1.Time, DATA2.Time, DATA2.Time, DATA2.Time ,DATA2.Time];
Plot1.Color = [Options.Color.Green, Options.Color.Green, Options.Color.Green, Options.Color.Green, ...
               Options.Color.Red, Options.Color.Red, Options.Color.Red,Options.Color.Red]; 
Plot1.Style = [Options.Style.Line, Options.Style.Line, Options.Style.Line, Options.Style.Line, ...
               Options.Style.Dashed, Options.Style.Dashed, Options.Style.Dashed, Options.Style.Dashed];
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
Plot2.Datay = [DATA1.Cap5 DATA1.Cap6 DATA1.Cap7 DATA1.Cap8, DATA2.Cap5 DATA2.Cap6 DATA2.Cap7 DATA2.Cap8];
Plot2.Datax = [DATA1.Time DATA1.Time DATA1.Time DATA1.Time, DATA2.Time DATA2.Time DATA2.Time DATA2.Time];
Plot2.Color = [Options.Color.Green Options.Color.Green Options.Color.Green Options.Color.Green ...
               Options.Color.Red Options.Color.Red Options.Color.Red Options.Color.Red];
Plot2.Style = [Options.Style.Line Options.Style.Line Options.Style.Line Options.Style.Line ...
               Options.Style.Dashed Options.Style.Dashed Options.Style.Dashed Options.Style.Dashed];
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
Plot3.Datay = [DATA1.Cap9 DATA1.Cap10 DATA1.Cap11 DATA1.Cap12, DATA2.Cap9 DATA2.Cap10 DATA2.Cap11 DATA2.Cap12];
Plot3.Datax = [DATA1.Time DATA1.Time DATA1.Time DATA1.Time, DATA2.Time DATA2.Time DATA2.Time DATA2.Time];
Plot3.Color = [Options.Color.Green Options.Color.Green Options.Color.Green Options.Color.Green ...
               Options.Color.Red Options.Color.Red Options.Color.Red Options.Color.Red];
Plot3.Style = [Options.Style.Line Options.Style.Line Options.Style.Line Options.Style.Line ...
               Options.Style.Dashed Options.Style.Dashed Options.Style.Dashed Options.Style.Dashed];
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
% Plot4.Datay = [DATA1.Cap13 DATA1.Cap14 DATA1.Cap15 DATA1.Cap16, DATA2.Cap13 DATA2.Cap14 DATA2.Cap15 DATA2.Cap16];
% Plot4.Datax = [DATA1.Time DATA1.Time DATA1.Time DATA1.Time, DATA2.Time DATA2.Time DATA2.Time DATA2.Time];
% Plot4.Color = [Options.Color.Green Options.Color.Green Options.Color.Green Options.Color.Green ...
%                Options.Color.Red Options.Color.Red Options.Color.Red Options.Color.Red];
% Plot4.Style = [Options.Style.Line Options.Style.Line Options.Style.Line Options.Style.Line ...
%                Options.Style.Dashed Options.Style.Dashed Options.Style.Dashed Options.Style.Dashed];

Plot4.Datay = [DATA1.Cap13 DATA2.Cap16];
Plot4.Datax = [DATA1.Time DATA2.Time];
Plot4.Color = [Options.Color.Green Options.Color.Red];
Plot4.Style = [Options.Style.Line Options.Style.Dashed];
Plot4.XLim = [0 0.55];
Plot4.YLim = [90 110];
% Plot4.Vline = [0.1 0.25];
% Plot4.VlineLim = [90 110];
% Plot4.Hline = [95 105];
% Plot4.HlineLim = [0 0.8];

%% PLOT
figure1 = figure(1);
% t = tiledlayout(4,1,'Padding','compact','TileSpacing','compact');
% t.Units = Options.Units;
% t.OuterPosition = [0 0 Options.Width Options.Height];
% nexttile;
PLECSplot(Plot4, Options)
% nexttile;
% PLECSplot(Plot2, Options)
% nexttile;
% PLECSplot(Plot3, Options)
% nexttile;
% PLECSplot(Plot4, Options)



%% SAVE
% set(gcf, 'WindowState', 'maximized');
% plot2file(figure1, Options, ImageTitle);