typemax(::Type{CompoundPeriod}) = Year
typemin(::Type{CompoundPeriod}) = Nanosecond

typemax(::Type{P}) where {P<:Period} = P
typemin(::Type{P}) where {P<:Period} = P

# the extremal Periods with nonzero value
max(x::CompoundPeriod) = isempty(x) ? x : x.periods[1]
min(x::CompoundPeriod) = isempty(x) ? x : x.periods[end]
minmax(x::CompoundPeriod) = min(x), max(x)

max(x::Period) = x
min(x::Period) = x
minmax(x::Period) = x, x
