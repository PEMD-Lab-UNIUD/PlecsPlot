function annotateXY(ax, Note, Options)
    if strcmp(Note.Type, 'textbox')
        [normx1, normy1] = coord2norm(ax, Note.XPosition(1), Note.YPosition(1));
        [normx2, normy2] = coord2norm(ax, Note.XPosition(2), Note.YPosition(2));
        dim = [normx1 normy2 (normx2-normx1) (normy1-normy2)];
        an = annotation(Note.Type, dim, 'String', Note.Text);
        setObjProperty(an, Note.Style);
        setObjProperty(an, Options);
    elseif strcmp(Note.Type, 'ellipse') || strcmp(Note.Type, 'rectangle')
        [normx1, normy1] = coord2norm(ax, Note.XPosition(1), Note.YPosition(1));
        [normx2, normy2] = coord2norm(ax, Note.XPosition(2), Note.YPosition(2));
        dim = [normx1 normy2 (normx2-normx1) (normy1-normy2)];
        an = annotation(Note.Type,  dim);
        setObjProperty(an, Note.Style);
    elseif strcmp(Note.Type, 'textarrow')
        [normx1, normy1] = coord2norm(ax, Note.XPosition(1), Note.YPosition(1));
        [normx2, normy2] = coord2norm(ax, Note.XPosition(2), Note.YPosition(2));
        an = annotation(Note.Type,  [normx1, normx2],  [normy1, normy2], 'String', Note.Text);
        setObjProperty(an, Note.Style);
        setObjProperty(an, Options);
    else
        [normx1, normy1] = coord2norm(ax, Note.XPosition(1), Note.YPosition(1));
        [normx2, normy2] = coord2norm(ax, Note.XPosition(2), Note.YPosition(2));
        an = annotation(Note.Type,  [normx1, normx2],  [normy1, normy2]);
        setObjProperty(an, Note.Style);
    end
end