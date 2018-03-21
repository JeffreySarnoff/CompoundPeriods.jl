# make CompoundPeriod iterable

eltype(x::CompoundPeriod) = Period
length(x::CompoundPeriod) = length(x.periods)

start(x::CompoundPeriod) = 1
done(x::CompoundPeriod, state) = state > length(x)
next(x::CompoundPeriod, state) = x.periods[state], state+1

reverseind(x::CompoundPeriod, idx) = length(x) - idx + 1

eltype(x::ReverseCompoundPeriod) = Period
length(x::ReverseCompoundPeriod) = length(x.periods)

start(x::ReverseCompoundPeriod) = length(x)
done(x::ReverseCompoundPeriod, state) = state < 1
next(x::ReverseCompoundPeriod, state) = x.periods[state], state-1


# make Period iterable for interoperability with CompoundPeriod

eltype(x::Period) = typeof(x)
length(x::Period) = 1

start(x::Period) = 1
done(x::Period, state) = state > 1
next(x::Period, state) = x, state+1

reverseind(x::Period, idx) = idx == 1 ? 1 : throw(BoundsError("$x [$idx]"))
