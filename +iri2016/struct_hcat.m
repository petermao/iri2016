function output=struct_hcat(s1,s2,skiplist)
    % horizontally concatenate fields in structures

    if isempty(s1)
        output=s2;
        return;
    end
    if isempty(s2)
        output=s1;
        return;
    end
    
    for fcell=fields(s1)'
        ff = fcell{1};
        if ismember(ff,skiplist)
            output.(ff) = s1.(ff);
            continue
        end
        if isfield(s2,ff)
            output.(ff) = [s1.(ff) s2.(ff)];
        else
            fprintf(1, '%s does not exist in second structure', ff);
        end
    end
end

