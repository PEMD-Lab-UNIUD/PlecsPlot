function currents = importfileCurrents(filename, dataLines)
%IMPORTFILE Import data from a text file
%  TORQUESPEED = IMPORTFILETORQUESPEED(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  TORQUESPEED = IMPORTFILETORQUESPEED(FILE, DATALINES) reads data for the
%  specified row interval(s) of text file FILENAME. Specify DATALINES as
%  a positive scalar integer or a N-by-2 array of positive scalar
%  integers for dis-contiguous row intervals.
%
%  Example:
%  TorqueSpeed = importfileTorqueSpeed("C:\Users\ricca\OneDrive - Università degli Studi di Udine\MMC - PEMD - MMC\Tracce\CSV\TorqueSpeed.csv", [2, Inf]);
%
%  See also READTABLE.

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 8);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Time", "Idref","Id", "Iqref", "Iq", "Ia", "Ib", "Ic"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
currents = readtable(filename, opts);

end