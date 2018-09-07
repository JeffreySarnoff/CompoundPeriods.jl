# make CompoundPeriod iterable

eltype(x::CompoundPeriod) = Period
length(x::CompoundPeriod) = length(x.periods)

eltype(x::ReverseCompoundPeriod) = Period
length(x::ReverseCompoundPeriod) = length(x.cperiod.periods)

Base.iterate(x::CompoundPeriod) = 1
Base.iterate(x::CompoundPeriod, state=(length(x), 1)) = state[2] <= state[1] ? x.periods[state], (state[1], state[2]+1) : nothing

Base.iterate(x::ReverseCompoundPeriod) =length(x.cperiod.periods)
Base.iterate(x::ReverseCompoundPeriod, state=(length(x), length(x))) = state[2] > 0 ? x.cperiod.periods[state], (state[1], state[2]-1) : nothing


# make Period iterable for interoperability with CompoundPeriod

eltype(x::Period) = typeof(x)
length(x::Period) = 1

Base.iterate(x::Period) = 1
Base.iterate(x::Period, state=1) = state > 1 ? nothing : x, 2


