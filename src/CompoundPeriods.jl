module CompoundPeriods

export Period, CompoundPeriod

import Base: start, done, next, getindex, eltype, length,
    min, max, minmax, typemin, typemax

import Dates: Period, CompoundPeriod
using Dates

include("iterable.jl")
include("indexable.jl")
include("min_max.jl")


end # Compound Periods
