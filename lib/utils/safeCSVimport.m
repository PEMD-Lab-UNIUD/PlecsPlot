function DATA = safeCSVimport(filename)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    filenameMAT = ["..\Data\" filename ".mat"];
    filenameCSV = ["..\CSV\" filename ".csv"];


    if exist(filenameMAT) == 2
       disp('File exsits!');
       load(filenameMAT)
    else
       disp('File NOT found');
        DATA = importfileCap(filenameCSV);
        metadata = dir(filenameCSV);
        save(filenameMAT, 'metadata', 'DATA');
    end
    
    if (metadata.bytes ~= dir(filenameCSV).bytes)
       disp ('File is Obsolete');
       DATA = importfileCap(filenameCSV);
       metadata = dir(filenameCSV)
       save(filenameMAT, 'metadata', 'DATA');
    end
end