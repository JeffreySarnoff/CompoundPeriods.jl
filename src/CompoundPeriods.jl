__precompile__()

module CompoundPeriods

export Period, CompoundPeriod, ReverseCompoundPeriod,
    typesof, canonical,
    Years, Months, Weeks, Days, Hours, Minutes, Seconds,
    Milliseconds, Microseconds, Nanoseconds, TimeUnits,
    years, months, weeks, days, hours, minutes, seconds,
    milliseconds, microseconds, nanoseconds

import Base: convert, 
    start, done, next, getindex, lastindex, eltype, length,
    min, max, minmax, reverseind, string, show, reverse, fldmod,
    (==), (!=), (<=), (<), (>=), (>), isequal, isless

import Dates: AbstractTime, Period, CompoundPeriod, canonicalize,
    Year, Month, Week, Day, Hour, Minute, Second, Millisecond, Microsecond, Nanosecond,
    year, month, week, day, hour, minute, second, millisecond, microsecond, nanosecond

using Dates: Time, Date, DateTime
using Dates


include("timeunitper.jl")
include("reversecompound.jl")

const Diurnal   = Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, Day, Week}
const Periodous = Union{CompoundPeriod, ReverseCompoundPeriod}

include("iterable.jl")
include("indexable.jl")
include("misc.jl")
include("selector.jl")
include("canonical.jl")
include("compare.jl")
include("pluralperiods.jl")

end # Compound Periods
