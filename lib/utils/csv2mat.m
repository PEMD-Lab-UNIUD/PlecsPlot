function DATA = csv2mat(filename)
%CSV2MAT import data from CSV file and updates the data if the CSV has been
% updated
    filenameMAT = '..\Data\'+filename+'.mat';
    filenameCSV = '..\CSV\'+filename+'.csv';

    if ~exist('..\Data\', 'dir')
       mkdir('..\Data\')
    end

    if exist(filenameMAT) == 2 
       disp ('File exsits!');
       load(filenameMAT)
    else 
       disp ('File NOT found');
       DATA = importfileCap(filenameCSV);
       metadata = dir(filenameCSV)
       save(filenameMAT, 'metadata', 'DATA');
    end
    
    if (metadata.bytes ~= dir(filenameCSV).bytes)
       disp ('File is Obsolete');
       DATA = importfileCap(filenameCSV);
       metadata = dir(filenameCSV)
       save(filenameMAT, 'metadata', 'DATA');
    end

end