clc
clear
close all
filenameMAT = "..\Data\SM_startup.mat";
filenameCSV = "..\CSV\SM_startup.csv";
DATA = importfileCap(filenameCSV);

%%

for i=2:17
    PHA.S
end

save(filenameMAT);