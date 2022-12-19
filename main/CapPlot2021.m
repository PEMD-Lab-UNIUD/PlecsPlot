clc
clear
close all

warning('on','all')
warning

debugmode(true)

outputmode(true)

file_new = "cap";
file_old = "cap_old_good";%"cap_old";

DATA_new = csv2mat(file_new);
DATA_old = csv2mat(file_old);

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
Options = plotOptions_V2();

%% PLOT TO FILE
% DirectoryFigure = "..\Fig\";
ImageTitle = "CapAmplitudesnew";
% ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot(1).Title.String = "Phase A - Upper Sub-Arm - Upper Arm SMs Voltage Amplitude";
Plot(1).YLabel.String = "Voltage [V]";
Plot(1).XLabel.String = "";
Plot(1).Axis.XTickLabel = "";

Plot(1).Legend.String = ["Fixed", "","","", "Adaptive","","",""];
Plot(1).Legend.Style.Location = "NorthEast";
Plot(1).Legend.Style.NumColumns = 1;

Plot(1).Trace(1).Y = DATA_old.Cap1;
Plot(1).Trace(2).Y = DATA_old.Cap2;
Plot(1).Trace(3).Y = DATA_old.Cap3;
Plot(1).Trace(4).Y = DATA_old.Cap4;
Plot(1).Trace(5).Y = DATA_new.Cap1;
Plot(1).Trace(6).Y = DATA_new.Cap2;
Plot(1).Trace(7).Y = DATA_new.Cap3;
Plot(1).Trace(8).Y = DATA_new.Cap4;
Plot(1).Trace(1).X = DATA_old.Time;
Plot(1).Trace(2).X = DATA_old.Time;
Plot(1).Trace(3).X = DATA_old.Time;
Plot(1).Trace(4).X = DATA_old.Time;
Plot(1).Trace(5).X = DATA_new.Time;
Plot(1).Trace(6).X = DATA_new.Time;
Plot(1).Trace(7).X = DATA_new.Time;
Plot(1).Trace(8).X = DATA_new.Time;

Plot(1).Trace(1).Style.Color = Options.Color.Red;
Plot(1).Trace(2).Style.Color = Options.Color.Red;
Plot(1).Trace(3).Style.Color = Options.Color.Red;
Plot(1).Trace(4).Style.Color = Options.Color.Red;
Plot(1).Trace(5).Style.Color = Options.Color.Green;
Plot(1).Trace(6).Style.Color = Options.Color.Green;
Plot(1).Trace(7).Style.Color = Options.Color.Green;
Plot(1).Trace(8).Style.Color = Options.Color.Green;

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

Plot(1).Axis.XLim = [0 0.8];
Plot(1).Axis.YLim = [90 110];

%% PLOT 2
Plot(2).Title.String = "Phase A - Lower Sub-Arm - Upper Arm SMs Voltage Amplitude";
Plot(2).YLabel.String = "Voltage [V]";
Plot(2).XLabel.String = "";
Plot(2).Axis.XTickLabel = "";

Plot(2).Legend.String = ["Fixed", "","","", "Adaptive","","",""];
Plot(2).Legend.Style.Location = "NorthEast";
Plot(2).Legend.Style.NumColumns = 1;

Plot(2).Trace(1).Y = DATA_old.Cap5;
Plot(2).Trace(2).Y = DATA_old.Cap6;
Plot(2).Trace(3).Y = DATA_old.Cap7;
Plot(2).Trace(4).Y = DATA_old.Cap8;
Plot(2).Trace(5).Y = DATA_new.Cap5;
Plot(2).Trace(6).Y = DATA_new.Cap6;
Plot(2).Trace(7).Y = DATA_new.Cap7;
Plot(2).Trace(8).Y = DATA_new.Cap8;
Plot(2).Trace(1).X = DATA_old.Time;
Plot(2).Trace(2).X = DATA_old.Time;
Plot(2).Trace(3).X = DATA_old.Time;
Plot(2).Trace(4).X = DATA_old.Time;
Plot(2).Trace(5).X = DATA_new.Time;
Plot(2).Trace(6).X = DATA_new.Time;
Plot(2).Trace(7).X = DATA_new.Time;
Plot(2).Trace(8).X = DATA_new.Time;

Plot(2).Trace(1).Style.Color = Options.Color.Red;
Plot(2).Trace(2).Style.Color = Options.Color.Red;
Plot(2).Trace(3).Style.Color = Options.Color.Red;
Plot(2).Trace(4).Style.Color = Options.Color.Red;
Plot(2).Trace(5).Style.Color = Options.Color.Green;
Plot(2).Trace(6).Style.Color = Options.Color.Green;
Plot(2).Trace(7).Style.Color = Options.Color.Green;
Plot(2).Trace(8).Style.Color = Options.Color.Green;

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

Plot(2).Axis.XLim = [0 0.8];
Plot(2).Axis.YLim = [90 110];

%% PLOT 3
Plot(3).Title.String = "Phase A - Upper Sub-Arm - Lower Arm SMs Voltage Amplitude";
Plot(3).YLabel.String = "Voltage [V]";
Plot(3).XLabel.String = "";
Plot(3).Axis.XTickLabel = "";

Plot(3).Legend.String = ["Fixed", "","","", "Adaptive","","",""];
Plot(3).Legend.Style.Location = "NorthEast";
Plot(3).Legend.Style.NumColumns = 1;

Plot(3).Trace(1).Y = DATA_old.Cap1;
Plot(3).Trace(2).Y = DATA_old.Cap2;
Plot(3).Trace(3).Y = DATA_old.Cap3;
Plot(3).Trace(4).Y = DATA_old.Cap4;
Plot(3).Trace(5).Y = DATA_new.Cap1;
Plot(3).Trace(6).Y = DATA_new.Cap2;
Plot(3).Trace(7).Y = DATA_new.Cap3;
Plot(3).Trace(8).Y = DATA_new.Cap4;
Plot(3).Trace(1).X = DATA_old.Time;
Plot(3).Trace(2).X = DATA_old.Time;
Plot(3).Trace(3).X = DATA_old.Time;
Plot(3).Trace(4).X = DATA_old.Time;
Plot(3).Trace(5).X = DATA_new.Time;
Plot(3).Trace(6).X = DATA_new.Time;
Plot(3).Trace(7).X = DATA_new.Time;
Plot(3).Trace(8).X = DATA_new.Time;

Plot(3).Trace(1).Style.Color = Options.Color.Red;
Plot(3).Trace(2).Style.Color = Options.Color.Red;
Plot(3).Trace(3).Style.Color = Options.Color.Red;
Plot(3).Trace(4).Style.Color = Options.Color.Red;
Plot(3).Trace(5).Style.Color = Options.Color.Green;
Plot(3).Trace(6).Style.Color = Options.Color.Green;
Plot(3).Trace(7).Style.Color = Options.Color.Green;
Plot(3).Trace(8).Style.Color = Options.Color.Green;

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

Plot(3).Axis.XLim = [0 0.8];
Plot(3).Axis.YLim = [90 110];

%% PLOT 4
Plot(4).Title.String = "Phase A - Lower Sub-Arm - Lower Arm SMs Voltage Amplitude";
Plot(4).YLabel.String = "Voltage [V]";
Plot(4).XLabel.String = "Time [s]";
% Plot(4).Axis.XTickLabel = "";

Plot(4).Legend.String = ["Fixed", "","","", "Adaptive","","",""];
Plot(4).Legend.Style.Location = "NorthEast";
Plot(4).Legend.Style.NumColumns = 1;

Plot(4).Trace(1).Y = DATA_old.Cap1;
Plot(4).Trace(2).Y = DATA_old.Cap2;
Plot(4).Trace(3).Y = DATA_old.Cap3;
Plot(4).Trace(4).Y = DATA_old.Cap4;
Plot(4).Trace(5).Y = DATA_new.Cap1;
Plot(4).Trace(6).Y = DATA_new.Cap2;
Plot(4).Trace(7).Y = DATA_new.Cap3;
Plot(4).Trace(8).Y = DATA_new.Cap4;
Plot(4).Trace(1).X = DATA_old.Time;
Plot(4).Trace(2).X = DATA_old.Time;
Plot(4).Trace(3).X = DATA_old.Time;
Plot(4).Trace(4).X = DATA_old.Time;
Plot(4).Trace(5).X = DATA_new.Time;
Plot(4).Trace(6).X = DATA_new.Time;
Plot(4).Trace(7).X = DATA_new.Time;
Plot(4).Trace(8).X = DATA_new.Time;

Plot(4).Trace(1).Style.Color = Options.Color.Red;
Plot(4).Trace(2).Style.Color = Options.Color.Red;
Plot(4).Trace(3).Style.Color = Options.Color.Red;
Plot(4).Trace(4).Style.Color = Options.Color.Red;
Plot(4).Trace(5).Style.Color = Options.Color.Green;
Plot(4).Trace(6).Style.Color = Options.Color.Green;
Plot(4).Trace(7).Style.Color = Options.Color.Green;
Plot(4).Trace(8).Style.Color = Options.Color.Green;

Plot(4).Vline(1).X = 0.01;
Plot(4).Vline(1).Y = [-100 1500];
Plot(4).Vline(2).X = 0.1;
Plot(4).Vline(2).Y = [-100 1500];
Plot(4).Vline(3).X = 0.2;
Plot(4).Vline(3).Y = [-100 1500];
Plot(4).Vline(4).X = 0.25;
Plot(4).Vline(4).Y = [-100 1500];
Plot(4).Vline(5).X = 0.3;
Plot(4).Vline(5).Y = [-100 1500];
Plot(4).Vline(6).X = 0.4;
Plot(4).Vline(6).Y = [-100 1500];
Plot(4).Vline(7).X = 0.5;
Plot(4).Vline(7).Y = [-100 1500];
Plot(4).Vline(8).X = 0.7;
Plot(4).Vline(8).Y = [-100 1500];

Plot(4).Axis.XLim = [0 0.8];
Plot(4).Axis.YLim = [90 110];


%% PLOT
fig1 = figure("Name", ImageTitle, "WindowState", "maximized"); 
drawnow;
t = tiledlayout(length(Plot),1,"Padding","compact","TileSpacing","compact");
t.Units = Options.Units;
t.OuterPosition = [0 0 Options.Width Options.Height];

for i=1:length(Plot)
  nexttile;
  PLECSplot(Plot(i), Options)
end

%% SAVE
plot2file(fig1, Options, ImageTitle);