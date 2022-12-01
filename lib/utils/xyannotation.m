function ah = xyannotation(varargin)
% xyannotation creates an annotation object with the x-y coordinates
% of a specific axes handle.
% 
% ah = xyannotation(type, x, y)
%   adds an annotation to the current active axes using the gca
%   function. If no axes object exists, one will be created.
% Input:
%   type - The type of annotation object to create.
%          ('line' | 'arrow' | 'doublearrow' | 'textarrow' | 'rectangle' | 'ellipse' | 'textbox')
%   x    - A 2 element vector containing the x-coordinates of the arrow within
%          the current axes object, of the form [xstart xend]
%   y    - A 2 element vector containing the y coordinates of the arrow within
%   	   the current axes object, of the form [ystart yend]
% Output:
%   ah - the arrow annotation handle
%
% ah = xyannotation(axes, ___)
%   adds an arrow annotation to the specified axes handle.
% Input:
%   ax - The axes object on which to overlay the arrow annotation
% Output:
%   ah - the arrow annotation handle
%
% ah = xyannotation(figure, ___)
%   adds an arrow annotation to the active axes handle within the specified
%   figure. If no axes object exists, one will be created.
% Input:
%   figure - The figure handle to which add the arrow annotation. The
%            annotation position will be calculated according to the x-y
%            axes of the active axes object within this figure.
% Output:
%   ah - the arrow annotation handle
%
% ah = xyannotation(___, [Name, Value])
%   Also takes in extra arguments to pass over to annotation. Use any
%   properties you usually pass to the builtin annotation function.
%
% Author - TADA, 2020
%
    assert(nargin >= 3, 'not enough input arguments. expecting at least x and y position vectors');
    
    if isa(varargin{1}, 'matlab.graphics.axis.Axes')
        ax = varargin{1};
        startParsingArgsAt = 2;
    elseif isa(varargin{1}, 'matlab.ui.Figure')
        ax = gca(varargin{1});
        startParsingArgsAt = 2;
    else
        ax = gca();
        startParsingArgsAt = 1;
    end
    
    % get the annotation type and position args
    anotype = varargin{startParsingArgsAt};
    x = varargin{startParsingArgsAt+1};
    y = varargin{startParsingArgsAt+2};
    startParsingArgsAt = startParsingArgsAt + 3;
    
    assert(ischar(anotype) && isrow(anotype) || isStringScalar(anotype), 'Annotation type must be a string scalar or a character row vector');
    assert(~isempty(anotype), 'Must specify annotation type');
    
    % validate annotation type and determine the format of annotation
    % object position vectors
    if ismember(anotype, {'line', 'arrow', 'doublearrow', 'textarrow'})
        usexywhPosition = false;
    elseif ismember(anotype, {'rectangle', 'ellipse', 'textbox'})
        usexywhPosition = true;
    else
        throw(MException('xyannotation:InvalidAnnotationType', 'Annotation type not supported, must be one of {''line'', ''arrow'', ''doublearrow'', ''textarrow'', ''rectangle'', ''ellipse'', ''textbox''}'));
    end
    
    % this is the container which will be the parent of the annotation
    % object
    container = ax.Parent;
    
    % validate x and y vectors
    assert(numel(x) == 2 && isnumeric(x), 'x must be a two element vector which represents the x start and end coordinates for line annotation objects and the position and width for shape annotation objects');
    assert(numel(y) == 2 && isnumeric(y), 'y must be a two element vector which represents the y start and end coordinates for line annotation objects and the position and height for shape annotation objects');
    
    % get absolute position of axes in pixels
    axPos = getPos(ax, 'pixels');
    
    % get size of axes in pixels
    axSize = getSize(ax, 'pixels');
    
    % get the axes x-y limits
    xlims = xlim(ax);
    ylims = ylim(ax);
    
    % calculate the conversion factor between x-y units and pixels
    x2pix = axSize(1)/range(xlims);
    y2pix = axSize(2)/range(ylims);
    
    % calculate the pixel position of the arrow
    xpos = (x - xlims(1)) * x2pix + axPos(1);
    ypos = (y - ylims(1)) * y2pix + axPos(2);
    
    % normalize x-y positions to the size of the container
    containerSize = getSize(container, 'pixels', 'inner');
    xposNorm = xpos / containerSize(1);
    xposNorm(xposNorm > 1) = 1;
    xposNorm(xposNorm < 0) = 0;
    yposNorm = ypos / containerSize(2);
    yposNorm(yposNorm > 1) = 1;
    yposNorm(yposNorm < 0) = 0;
    
    % create the annotation object
    if ~usexywhPosition
        ah = annotation(container, anotype, xposNorm, yposNorm, varargin{startParsingArgsAt:end});
    else
        pos = [xposNorm; yposNorm];
        pos(:,2) = pos(:,2) - pos(:,1);
        ah = annotation(container, anotype, pos(:)', varargin{startParsingArgsAt:end});
    end
end
function pos = getPos(h, units, type)
%GETPOS gets the position vector of a handle in the desired units and
%changes the units of that element back to the original setting
    if nargin < 2; units = 'norm'; end
    if nargin < 3; type = ''; end
    
    % detect original units of the handle
    originalUnits = get(h, 'Units');
    changeBack = false;
    
    % change to wanted units
    if ~strcmp(units, originalUnits)
        changeBack = true;
        set(h, 'Units', units);
    end
    % get position
    if strcmpi(type, 'inner') && ~isempty(findprop(h, 'InnerPosition'))
        pos = get(h, 'InnerPosition');
    else
        pos = get(h, 'Position');
    end
    
    % chnage units back to original value
    if changeBack
        set(h, 'Units', originalUnits);
    end
end
function siz = getSize(h, units, type)
%GETSIZE gets the size vector of a handle in the desired units and
%changes the units of that element back to the original setting
    if nargin < 2; units = 'norm'; end
    if nargin < 3; type = ''; end
    pos = getPos(h, units, type);
    siz = pos([3,4]);
end
