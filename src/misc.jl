# exported interface to Dates.canonicalize and enhancements
canonical(x::Period) = canonical(CompoundPeriod(x))
canonical(x::CompoundPeriod) = canonicalize(x)
canonical(x::ReverseCompoundPeriod) = ReverseCompoundPeriod(canonicalize(x.cperiod))

# foreach nonempty Period in a CompoundPeriod, get type of Period
typesof(x::CompoundPeriod) = map(typeof, x.periods)
typesof(x::P) where {P<:Period} = (P,)

# the extremal Periods with nonzero value
max(x::CompoundPeriod) = isempty(x) ? x : x.periods[1]
min(x::CompoundPeriod) = isempty(x) ? x : x.periods[end]
minmax(x::CompoundPeriod) = min(x), max(x)

maxtype(x::CompoundPeriod) = typeof(max(x))
mintype(x::CompoundPeriod) = typeof(min(x))

max(x::ReverseCompoundPeriod) = isempty(x) ? x : x.cperiod.periods[1]
min(x::ReverseCompoundPeriod) = isempty(x) ? x : x.cperiod.periods[end]
minmax(x::ReverseCompoundPeriod) = min(x), max(x)

maxtype(x::ReverseCompoundPeriod) = typeof(max(x))
mintype(x::ReverseCompoundPeriod) = typeof(min(x))

max(x::Period) = x
min(x::Period) = x
minmax(x::Period) = x, x
