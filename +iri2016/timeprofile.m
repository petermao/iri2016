function output=timeprofile(times, alts, glat, glon)
% compute IRI altitude profile over time range for fixed lat/lon
% times: vector [datetime], or [min max step]
% alts: vector of altitudes in [km]
% glat: latitude [deg]
% glon: longitude [deg]

%% check if alts is [min max step] or a vector of altitudes
    dalts = diff(alts);
    if ~(length(alts) == 3 && ~all(dalts > 0))
        assert(std(dalts) == 0);
        alts = [min(alts) max(alts) mean(dalts)];
    end


    %% run IRI on times specified, collate results.
    output = [];
    for time=times
        iri = iri2016.iri2016(time, glat, glon, alts);
        output = iri2016.struct_hcat(output, iri, {'altkm','lat','lon'});
    end
end

