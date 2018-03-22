__precompile__()

module CompoundPeriods

export Period, CompoundPeriod, ReverseCompoundPeriod,
   typesof, canonical

import Base: start, done, next, getindex, lastindex, eltype, length,
    min, max, minmax, reverseind, string, show, reverse, fldmod

import Dates: AbstractTime, Period, CompoundPeriod, canonicalize,
    Year, Month, Day, Hour, Minute, Second, Millisecond, Microsecond, Nanosecond

using Dates


include("timeunitper.jl")
include("reversecompound.jl")
include("iterable.jl")
include("indexable.jl")
include("misc.jl")
include("selector.jl")
include("canonical.jl")
include("compare.jl")


end # Compound Periods
