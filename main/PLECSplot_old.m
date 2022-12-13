function PLECSplot_old(Plot, Options)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for i=1:width(Plot.Datay)
        p(i) = plot(Plot.Datax(:,i), Plot.Datay(:,i));

        if isfield(Plot,'Color')
            p(i).Color = Plot.Color(i);
        else
            p(i).Color = Options.Color.Default(mod(i-1,length(Options.Color.Default))+1);
        end
        if isfield(Plot,'Style')
            p(i).LineStyle = Plot.Style(i);
        end
        p(i).LineWidth = Options.LineWidth;
        if isfield(Plot, 'Marker')
            p(i).Marker = Plot.Marker(i);
        end
        hold on; 
    end

    grid on; grid minor;


 ax = gca; 

%     fig = gcf;
% ax = fig.CurrentAxes;

    if isfield(Plot,'Note')
%         [normx, normy] = coord2norm(ax, Plot.Note.XPosition, Plot.Note.YPosition);
%         an = annotation(Plot.Note.Type, normx, normy, 'String', Plot.Note.Text);
%         note = Annotate(ax, Plot.Note.Type, Plot.Note.XPosition, Plot.Note.YPosition, 'string', Plot.Note.Text);
% for i=1:length(Plot.Note.XPosition)
%  [normx(i), normy(i)] = normalize_coordinate(Plot.Note.XPosition(i), Plot.Note.YPosition(i), ax, get(gca, 'xlim'), get(gca, 'ylim'), 0, 0);
% end
%        an = annotation(Plot.Note.Type, normx, normy, 'String', Plot.Note.Text);

% an = xyannotation(ax,'arrow', Plot.Note.XPosition, Plot.Note.YPosition)
    end 

    if isfield(Plot,'XLim')
        ax.XLim = Plot.XLim;
    end

    if isfield(Plot,'YLim')
        ax.YLim = Plot.YLim;
    end 
    
    if isfield(Plot,'Vline')
        for i=1:length(Plot.Vline)
            p(i) = plot([Plot.Vline(i), Plot.Vline(i)], [Plot.VlineLim(1), Plot.VlineLim(2)], Options.VlineStyle);
            p(i).LineWidth = Options.LineWidth;
            p(i).Color = Options.VlineColor;
            hold on; 
        end
    end 

    if isfield(Plot,'Hline')
        for i=1:length(Plot.Hline)
            p(i) = plot([Plot.HlineLim(1), Plot.HlineLim(2)], [Plot.Hline(i) Plot.Hline(i)], Options.HlineStyle);
            p(i).LineWidth = Options.LineWidth;
            p(i).Color = Options.HlineColor;
            hold on; 
        end
    end 

    if isfield(Plot,'XTick')
        ax.XTick = Plot.XTick;
    end

    if isfield(Plot,'YTick')
        ax.YTick = Plot.YTick;
    end

    if isfield(Plot,'XTickLabel')
%         xticklab =  xticklabels(Plot.XTickLabel);
        ax.XTickLabel = Plot.XTickLabel;
    end
    
    ax.FontSize = Options.FontSizeTick;
    ax.TickLabelInterpreter = Options.Interpreter;

    if isfield(Plot,'XTickLabel')
        ax.XTickLabel = Plot.XTickLabel;
    end

    ylab = ylabel(Plot.Ylabel);
    ylab.Interpreter = Options.Interpreter;
    ylab.FontSize =  Options.FontSizeLabel;

    xlab = xlabel(Plot.Xlabel);
    xlab.Interpreter = Options.Interpreter;
    xlab.FontSize =  Options.FontSizeLabel;
    
    
    tit = title(Plot.FigureTitle);
    tit.Interpreter = Options.Interpreter;
    tit.FontSize = Options.FontSizeTitle;

    if isfield(Plot,'Legend')
        lgd = legend(Plot.Legend);
        disp(Plot.Legend)
        lgd.Location = Plot.LocationLegend;
        lgd.Interpreter = Options.Interpreter;
        lgd.FontSize = Options.FontSizeLegend;
        lgd.NumColumns = Plot.NumColumns;
    end



end