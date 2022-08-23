clc
clear
close all
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

%% Definizione parametri plot
Options = plotOptions();

%% PLOT TO FILE
DirectoryFigure = "..\Fig\";
ImageTitle = "Currents";
ImageTitle = DirectoryFigure+ImageTitle;

%% PLOT 1
Plot1.FigureTitle = "Id*/Id";
Plot1.Ylabel = "Current [A]";
Plot1.Xlabel = '';
Plot1.Legend = {'Reference', 'Actual'};
Plot1.LocationLegend = 'NorthEast';
Plot1.NumColumns = 1;
Plot1.Datay = [DATA.Idref DATA.Id];
Plot1.Datax = [DATA.Time DATA.Time];
Plot1.XTickLabel = '';

%% PLOT 2
Plot2.FigureTitle = "Iq*/Iq";
Plot2.Ylabel = "Current [A]";
Plot2.Xlabel = '';
Plot2.Legend = {'Reference', 'Actual'};
Plot2.LocationLegend = 'NorthEast';
Plot2.NumColumns = 1;
Plot2.Datay = [DATA.Iqref DATA.Iq];
Plot2.Datax = [DATA.Time DATA.Time];
Plot2.XTickLabel = '';

%% PLOT 2
Plot3.FigureTitle = "3-phase Stationary reference frame";
Plot3.Ylabel = "Current [A]";
Plot3.Xlabel = '';
Plot3.Legend = {'Phase A', 'Phase B', 'Phase C'};
Plot3.LocationLegend = 'NorthEast';
Plot3.NumColumns = 1;
Plot3.Datay = [DATA.Ia DATA.Ib, DATA.Ic];
Plot3.Datax = [DATA.Time DATA.Time DATA.Time];
Plot3.XTickLabel = '';


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