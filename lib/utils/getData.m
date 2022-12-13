function DATA = getData(filename)
%getData retreive the data from the file
%   it checks if the matfile exist and load the data from it, if not it uses the
%   csv file, additionally it performs a check on the validity of the data
%   loaded from the matfile. In this way by simply adding the new csv file the
%   data will be updated

filenameMAT = "..\Data\" + filename + ".mat";
filenameCSV = "..\CSV\" + filename + ".csv";


    if ~exist('../Data', 'dir')
       mkdir('../Data')
    end

    if ~exist('../CSV', 'dir')
       mkdir('../CSV')
    end

% mkdir 
% mkdir ../ CSV

    if exist(filenameMAT, "file") == 2
       debugout("File exsits!")
       load(filenameMAT, 'DATA', 'metadata')
    else
       debugout("File NOT found");
       DATA = importfileTorqueSpeed(filenameCSV);
       metadata = dir(filenameCSV);
       save(filenameMAT, "metadata", "DATA");
    end

    if (metadata.bytes ~= dir(filenameCSV).bytes || datetime(metadata.date, "Locale", "system") < datetime(dir(filenameCSV).date, "Locale", "system"))
       debugout("File is Obsolete");
       DATA = importfileHFamp(filenameCSV);
       metadata = dir(filenameCSV);
       save(filenameMAT, "metadata", "DATA");
    end
end