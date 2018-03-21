function getindex(x::CompoundPeriod, idx::Int)
    n = length(x.periods)
    (idx == 0 || idx > n) && throw(BoundsError("$x [$idx]"))
    return x.periods[idx]
end

function getindex(x::Period, idx::Int)
    idx != 1 && throw(BoundsError("index must be 1"))
    return x
end

