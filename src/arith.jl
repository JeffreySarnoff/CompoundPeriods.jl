#=
function (+)(cperiod1::CompoundPeriod, cperiod2::CompoundPeriod)
    isempty(cperiod1) && return cperiod2
    isempty(cperiod2) && return cperiod1
    result = cperiod1
    for p in cperiod2
       result += p
    end
    return result
end

function (-)(cperiod1::CompoundPeriod, cperiod2::CompoundPeriod)
    isempty(cperiod2) && return cperiod1
    isempty(cperiod1) && return -cperiod2
    result = cperiod1
    for p in cperiod2
       result -= p
    end
    return result
end

function (+)(cperiod::CompoundPeriod, period::Period)
    isempty(cperiod) && return period
    isempty(period) && return cperiod
    result = cperiod + period
    result = canonical(result)
    return result
end

function (-)(cperiod::CompoundPeriod, period::Period)
    isempty(cperiod) && return -period
    isempty(period) && return cperiod
    result = cperiod - period
    result = canonical(result)
    return result
end

(+)(period::Period, cperiod::CompoundPeriod) = cperiod + period
(-)(period::Period, cperiod::CompoundPeriod) = cperiod + period
=#
