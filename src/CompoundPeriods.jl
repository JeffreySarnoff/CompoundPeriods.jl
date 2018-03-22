__precompile__()

module CompoundPeriods

export Period, CompoundPeriod, ReverseCompoundPeriod,
    typesof, canonical,
    Years, Months, Days, Hours, Minutes, Seconds,
    Milliseconds, Microseconds, Nanoseconds, TimeUnits

import Base: start, done, next, getindex, lastindex, eltype, length,
    min, max, minmax, reverseind, string, show, reverse, fldmod,
    (==), (!=), (<=), (<), (>=), (>), isequal, isless

import Dates: AbstractTime, Period, CompoundPeriod, canonicalize,
    Year, Month, Day, Hour, Minute, Second, Millisecond, Microsecond, Nanosecond

using Dates

const Periodal = Union{Period, CompoundPeriod}

include("timeunitper.jl")
include("reversecompound.jl")
include("iterable.jl")
include("indexable.jl")
include("misc.jl")
include("selector.jl")
include("canonical.jl")
include("compare.jl")
include("pluralperiods.jl")

end # Compound Periods
