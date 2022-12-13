function object = setObjProperty(object,parameters)
% 

    if isstruct(parameters)
        paramFields = fieldnames(parameters);
        for i=1:length(paramFields)
            try
                field = cell2mat(paramFields(i));
                set(object, field, parameters.(field))
                message = sprintf("Parameter %25s \t of object %40s \t  modified succesfully \f", field, class(object));
%                 test = cprintf('green', ); 
                debugout(message)
            catch ME
                %                     debugout_V2("Parameter " + field + " <strong>not</strong> exsists in object " +  class(object));
                %                 debugout(field);
                %                 debugout("Parameter not defined")
                message = sprintf("Parameter %25s \t of object %40s \t[\b <strong> NOT EXSITS</strong>]\b ", field, class(object));
                debugout(message)
            end
        end
    else
        message = sprintf("Parameter %25s \t of object %40s \t [\b <strong>IS EMPTY</strong>]\b", parameters, class(object));
        debugout(message)
    end
end




