__precompile__()

module CompoundPeriods

export Period, CompoundPeriod, ReverseCompoundPeriod,
   typesof, canonical

import Base: start, done, next, getindex, eltype, length,
    min, max, minmax, reverseind, string, show

import Dates: Period, CompoundPeriod,
    Year, Month, Day, Hour, Minute, Second, Millisecond, Microsecond, Nanosecond

using Dates

struct ReverseCompoundPeriod
   cperiod::CompoundPeriod
end

include("timeunitper.jl")
include("iterable.jl")
include("indexable.jl")
include("misc.jl")
include("canonical.jl")
include("selector.jl")
include("compare.jl")


end # Compound Periods
