function DATA = importfileSMstartup(filename, dataLines)
%IMPORTFILE Import data from a text file
%  CFCOSC = IMPORTFILE(FILENAME) reads data from text file FILENAME for
%  the default selection.  Returns the data as a table.
%
%  CFCOSC = IMPORTFILE(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  cfcosc = importfile("C:\Users\ricca\OneDrive - Universit√† degli Studi di Udine\MMC - PEMD - MMC\Tracce\CSV\cfc_osc.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 05-Aug-2022 12:47:49

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 49);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Time", ...
"SMa1", "SMa2", "SMa3", "SMa4", "SMa5", "SMa6", "SMa7", "SMa8", "SMa9", "SMa10", "SMa11", "SMa12", "SMa13", "SMa14", "SMa15", "SMa16", ...
"SMb1", "SMb2", "SMb3", "SMb4", "SMb5", "SMb6", "SMb7", "SMb8", "SMb9", "SMb10", "SMb11", "SMb12", "SMb13", "SMb14", "SMb15", "SMb16", ...
"SMc1", "SMc2", "SMc3", "SMc4", "SMc5", "SMc6", "SMc7", "SMc8", "SMc9", "SMc10", "SMc11", "SMc12", "SMc13", "SMc14", "SMc15", "SMc16"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
DATA = readtable(filename, opts);
end