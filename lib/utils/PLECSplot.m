function PLECSplot(Plot, Options)
%PLECSplot(Plot, Options) Plots figures in a plecslike fashion
%   Plot is a structure with all the plot specific data
%   Options is a structure that contains all the style options
    
    ax = gca; 
    setObjProperty(ax, Options.Axis);

    % Plot Trace
    p = gobjects(width(Plot.Trace),1); 

    for i=1:length(p)
        p(i) = plot(Plot.Trace(i).X, Plot.Trace(i).Y);
        hold on; 
        setObjProperty(p(i), Options.Style);
        
        if isfield(Plot.Trace(i), 'Style')
            setObjProperty(p(i), Plot.Trace(i).Style);
        end    
    end
    
    % Plot horizontal line
        if isfield(Plot,'Vline')
        v = gobjects(width(Plot.Vline),1);
        for i=1:length(v)
            v(i) = plot([Plot.Vline(i).X, Plot.Vline(i).X], [Plot.Vline(i).Y]);
            setObjProperty(v(i), Options.Line);
            if isfield(Plot.Vline(i), 'Style')
                setObjProperty(v(i), Plot.Vline(i).Style);
            end    
        end
    end
    
    % Plot vertical line
    if isfield(Plot,'Hline')
        h = gobjects(width(Plot.Hline),1);
        for i=1:length(h)
            h(i) = plot(Plot.Hline(i).X, [Plot.Hline(i).Y, Plot.Hline(i).Y]);
            setObjProperty(h(i), Options.Line);
            if isfield(Plot.Hline(i), 'Style')
                setObjProperty(h(i), Plot.Hline(i).Style);
            end
        end
    end
    
    grid on; grid minor;
    


    % set axis labels, ticks, ticklabels
        
    if isfield(Plot,'Axis')
        setObjProperty(ax, Plot.Axis);
        setObjProperty(ax, Options.Axis);
    end
    
    if isfield(Plot,'XLabel')
        xlab = xlabel(Plot.XLabel.String);
        setObjProperty(xlab, Plot.XLabel);
        setObjProperty(xlab, Options.Label);
    end
    
    if isfield(Plot,'YLabel')
        ylab = ylabel(Plot.YLabel.String);
        setObjProperty(ylab, Plot.YLabel);
        setObjProperty(ylab, Options.Label);
    end

     % set title
    
    if isfield(Plot,'Title')
        tit = title(Plot.Title.String);
        setObjProperty(tit, Plot.Title);
        setObjProperty(tit, Options.Title);
    end

     % set legend

    if isfield(Plot,'Legend')
        lgd = legend(Plot.Legend.String);
        setObjProperty(lgd, Plot.Legend);
        setObjProperty(lgd, Options.Legend);
    end

    %set axis annotation
    
    if isfield(Plot,'Note')
        for i=1:length(Plot.Note)
            annotateXY(ax, Plot.Note(i), Options.Note)
        end 
    end

    %set region fill
    
    if isfield(Plot,'Fill')
        for i=1:length(Plot.Fill)
            f(i) = fill(Plot.Fill(i).X, Plot.Fill(i).Y,Plot.Fill(i).Style.FaceColor);
        if isfield(Plot.Fill(i), 'Style')
            setObjProperty(f(i), Plot.Fill(i).Style);
        end
%             , Plot.Fill(i).Style.Color,'FaceAlpha',.5,'LineStyle',':');
        end 
    end

    % set legend

    if isfield(Plot,'Legend')
        lgd = legend(Plot.Legend.String);
        setObjProperty(lgd, Plot.Legend);
        setObjProperty(lgd, Options.Legend);
    end

end