function options = loadOptions(names)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Set up the Import Options and import the data
options = delimitedTextImportOptions("NumVariables", length(names));

% Specify range and delimiter
options.DataLines = [2, Inf];
options.Delimiter = ",";

% Specify column names and types
options.VariableNames = names;

% options.VariableTypes = "double";

% for i=1:length(names)
    options.VariableTypes(:) = {'double'}; 
% end
%  = ["double", "double", "double", "double", "double", "double"];

% Specify file level properties
options.ExtraColumnsRule = "ignore";
options.EmptyLineRule = "read";

end