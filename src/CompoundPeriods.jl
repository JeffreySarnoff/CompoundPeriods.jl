__precompile__()

module CompoundPeriods

export Period, CompoundPeriod, ReverseCompoundPeriod,
    typesof, canonical,
    Years, Months, Days, Hours, Minutes, Seconds,
    Milliseconds, Microseconds, Nanoseconds, TimeUnits

import Base: convert, 
    start, done, next, getindex, lastindex, eltype, length,
    min, max, minmax, reverseind, string, show, reverse, fldmod,
    (==), (!=), (<=), (<), (>=), (>), isequal, isless

import Dates: AbstractTime, Period, CompoundPeriod, canonicalize,
    Year, Month, Day, Hour, Minute, Second, Millisecond, Microsecond, Nanosecond

using Dates


include("timeunitper.jl")
include("reversecompound.jl")

const Diurnal   = Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, Day, Week}}
const Periodous = Union{CompoundPeriod, ReverseCompoundPeriod}

include("iterable.jl")
include("indexable.jl")
include("misc.jl")
include("selector.jl")
include("canonical.jl")
include("compare.jl")
include("pluralperiods.jl")

end # Compound Periods
