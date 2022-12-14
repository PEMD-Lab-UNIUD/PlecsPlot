function PLECSplot(Plot, Options)
    % PLECSPLOT(Plot, Options) Plots figures in a plecslike fashion
    %   Plot is a structure with all the plot specific data
    %   Options is a structure that contains all the style options

    ax = gca;
    setObjProperty(ax, Options.Axis);

    %% Traces
    if isfield(Plot,'Trace')
        p = gobjects(width(Plot.Trace),1);

        for i=1:length(p)
            p(i) = plot(Plot.Trace(i).X, Plot.Trace(i).Y);
            hold on;
            setObjProperty(p(i), Options.Style);

            if isfield(Plot.Trace(i), 'Style')
                setObjProperty(p(i), Plot.Trace(i).Style);
            end
        end
    end

    %% Legend
    if isfield(Plot,'Legend')
        if isstruct(Plot.Legend)
            lgd = legend(Plot.Legend.String);
            setObjProperty(lgd, Plot.Legend.Style);
            setObjProperty(lgd, Options.Legend);
        end
    end

    %% Plot vertical lines
    if isfield(Plot,'Vline')
        v = gobjects(width(Plot.Vline),1);
        for i=1:length(v)
            if isempty(Plot.Vline(i).Y)
                v(i) = xline(Plot.Vline(i).X,'HandleVisibility','off');                                         % for unlimited leght lines
            else
                v(i) = plot([Plot.Vline(i).X, Plot.Vline(i).X], [Plot.Vline(i).Y],'HandleVisibility','off'); % for limited leght lines
            end
            uistack(v(i), 'bottom');                                                                            % for staking the lines underneath the traces
            hold on;
            setObjProperty(v(i), Options.Line);
            if isfield(Plot.Vline(i), 'Style')
                setObjProperty(v(i), Plot.Vline(i).Style);
            end
        end
    end

    %% Plot horizontal lines
    if isfield(Plot,'Hline')
        h = gobjects(width(Plot.Hline),1);
        for i=1:length(h)
            if isempty(Plot.Hline(i).X)
                h(i) = yline(Plot.Hline(i).Y,'HandleVisibility','off'); % for unlimited leght lines
            else
                h(i) = plot(Plot.Hline(i).X, [Plot.Hline(i).Y, Plot.Hline(i).Y],'HandleVisibility','off'); % for limited leght lines
            end
            uistack(h(i), 'bottom'); % for staking the lines underneath the traces
            hold on;
            setObjProperty(h(i), Options.Line);
            if isfield(Plot.Hline(i), 'Style')
                setObjProperty(h(i), Plot.Hline(i).Style);
            end
        end
    end

    %% Plot Area under the traces
    if isfield(Plot,'Area')
        a = gobjects(width(Plot.Area),1);

        for i=1:length(a)
            a(i) = area(Plot.Area(i).X, Plot.Area(i).Y);
            hold on;
            setObjProperty(a(i), Options.Area.Style);
            uistack(a(i), 'bottom');
            hold on;
            if isfield(Plot.Area(i), 'Style')
                setObjProperty(a(i), Plot.Area(i).Style);
            end
        end
    end

    %% Set axis propoerties, labels, ticks, ticklabels
    if isfield(Plot,'Axis')
        setObjProperty(ax, Plot.Axis);
    end

    setObjProperty(ax, Options.Axis);
    drawnow;

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

    %% Set graph Title
    if isfield(Plot,'Title')
        if isstruct(Plot.Legend)
            tit = title(Plot.Title.String);
            setObjProperty(tit, Plot.Title);
            setObjProperty(tit, Options.Title);
        end
    end



    %% Set axis annotation
    if isfield(Plot,'Note')
        for i=1:length(Plot.Note)
            annotateXY(ax, Plot.Note(i), Options.Note)
        end
    end

    %% Set region fill
    if isfield(Plot,'Fill')
        f = gobjects(length(Plot.Fill),1);
        for i=1:length(Plot.Fill)
            f(i) = fill(Plot.Fill(i).X, Plot.Fill(i).Y,Plot.Fill(i).Style.FaceColor);
            if isfield(Plot.Fill(i), 'Style')
                setObjProperty(f(i), Plot.Fill(i).Style);
            end
        end
    end

    %% Add zoom on a graph region

    if isfield(Plot,'Zoom')
        subax = gobjects(length(Plot.Zoom),1);
        for i=1:length(Plot.Zoom)
            %% Create the embedded graph
            [normx1, normy1] = coord2norm(ax, Plot.Zoom(i).XPosition(1), Plot.Zoom(i).YPosition(1));
            [normx2, normy2] = coord2norm(ax, Plot.Zoom(i).XPosition(2), Plot.Zoom(i).YPosition(2));
            position = [normx1 normy2 (normx2-normx1) (normy1-normy2)];
            subax(i) = axes('position',position);
            box on % put box around new pair of axes
            axis tight
            pz = p;
            for k=1:length(p)
                pz(k) = plot(Plot.Trace(k).X, Plot.Trace(k).Y);
                hold on;
                setObjProperty(pz(k), Options.Style);
                if isfield(Plot.Trace(k), 'Style')
                    setObjProperty(pz(k), Plot.Trace(k).Style);
                end
            end
            xlim(Plot.Zoom(i).X)
            ylim(flip(Plot.Zoom(i).Y))
            setObjProperty(subax(i), Options.Axis);
        end 
    end

end