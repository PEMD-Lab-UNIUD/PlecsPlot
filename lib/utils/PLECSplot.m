function PLECSplot(Plot, Options)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for i=1:width(Plot.Datay)
        p(i) = plot(Plot.Datax(:,i), Plot.Datay(:,i), '-');
        p(i).LineWidth = Options.LineWidth;
        p(i).Color = Options.Color(i);
        hold on; 
    end

    grid on; grid minor;

    

    ax = gca; 
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
%         xtick = xticks(Plot.XTick);
        ax.XTick = Plot.XTick;
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