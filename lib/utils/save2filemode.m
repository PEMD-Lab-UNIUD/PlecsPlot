function [output_args] = save2filemode(varargin)
%save2filemode toggles the save2filemode environment variable for save2filemode
%
%   save2filemode
%   save2filemode(true)
%   save2filemode(1)
%
%   Calling save2filemode with no argument prints the current saving mode to
%   the Command Window.
%
%   Calling save2filemode with a boolean (or 1 or 0) argument sets the saving
%   mode by setting the environment variable.
%
%   Accepts:
%
%   Boolean (logicals) true, false, 1, 0
%
%   Strings not supported at this time: 'on', 'off', 'true', 'false'
%
%   Counts, VCSFA 2016
%     setting = 'false';
    if nargin == 0
        % no argument displays the current setting
    
        if isempty( getenv('save2filemode') )
            setenv('save2filemode', 'false');
        end
    
        fprintf( '<strong>save2filemode:</strong> %s\n', getenv('save2filemode') );
    
        return
    
    elseif nargin == 1
    
        trueFalse = varargin{1};
    
        switch class(varargin{1})
    
            case {'logical' 'double'}
    
                if trueFalse(1)
                    setting = 'true';
                    debugout('Saving output is active');
                else
                    setting = 'false';
                    debugout('Saving output is inactive');
                end
    
            otherwise
    
                % A case we don't support!
                warning( ['save2filemode() does not support arguments of type: ' class(trueFalse)]);
                return
        end
    
    end
     setenv('save2filemode', setting);
%     message = sprintf("save2filemode has been set to %s", setting);
%     debugout(message) 
end