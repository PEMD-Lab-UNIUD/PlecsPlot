function [output_args] = outputmode(varargin)
%outputmode toggles the outputOutput environment variable for outputout
%
%   outputmode
%   outputmode(true)
%   outputmode(1)
%
%   Calling outputmode with no argument prints the current outputging mode to
%   the Command Window.
%
%   Calling outputmode with a boolean (or 1 or 0) argument sets the output
%   mode by setting the environment variable.
%
%   Accepts:
%
%   Boolean (logicals) true, false, 1, 0
%
%   Strings not supported at this time: 'on', 'off', 'true', 'false'
%
%   Counts, VCSFA 2016
setting = 'false';
if nargin == 0
    % no argument displays the current setting
    
    if isempty( getenv('outputOutput') )
        setenv('outputOutput', 'false');
    end
    
    fprintf( '<strong>outputmode:</strong> %s\n', getenv('outputOutput') );
    
    return
    
elseif nargin == 1
    
    trueFalse = varargin{1};
    
    switch class(varargin{1})
        
        case {'logical' 'double'}
            
            if trueFalse(1)
                setting = 'true';
                
            else
                % defaults to turn off
            end
                
        otherwise
            
            % A case we don't support!
            warning( ['outputmode() does not support arguments of type: ' class(trueFalse)]);
            return
    end
            
end
setenv('outputOutput', setting);
debugout('Output is active');
end