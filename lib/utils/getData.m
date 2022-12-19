function DATA = getData(filename, options, forceUpdate)
%getData retreive the data from the file
%   it checks if the matfile exist and load the data from it, if not it uses the
%   csv file, additionally it performs a check on the validity of the data
%   loaded from the matfile. In this way by simply adding the new csv file the
%   data will be updated

% If dataLines is not specified, define defaults


filenameMAT = "..\Data\" + filename + ".mat";
filenameCSV = "..\CSV\" + filename + ".csv";

if ~exist('options','var') || isempty(options)
  options=detectImportOptions(filenameCSV);
end

if ~exist('forceUpdate','var') || isempty(forceUpdate)
  forceUpdate=0;
end


% if nargin < 2
%     forceUpdate = 0;
%     options = detectImportOptions(filenameCSV);
% end

    if ~exist('../Data', 'dir')
       mkdir('../Data')
    end

    if ~exist('../CSV', 'dir')
       mkdir('../CSV')
    end

% mkdir 
% mkdir ../ CSV

    if (exist(filenameMAT, "file") == 2) &&  ~forceUpdate
       debugout("File exsits!")
       load(filenameMAT, 'DATA', 'metadata')
    else
       debugout("File NOT found or forced update");
%        DATA = importfileTorqueSpeed(filenameCSV);
%        DATA = importfileHFamp(filenameCSV);
%     DATA = importfileCurrents(filenameCSV);
   DATA = readtable(filenameCSV, options);
       metadata = dir(filenameCSV);
       save(filenameMAT, "metadata", "DATA");
    end

    if (metadata.bytes ~= dir(filenameCSV).bytes || datetime(metadata.date, "Locale", "system") < datetime(dir(filenameCSV).date, "Locale", "system"))
       debugout("File is Obsolete");
%        DATA = importfileTorqueSpeed(filenameCSV);
%        DATA = importfileHFamp(filenameCSV);
       DATA = importfileCurrents(filenameCSV);
       metadata = dir(filenameCSV);
       save(filenameMAT, "metadata", "DATA");
    end
end