using CompoundPeriods, Dates
using Test

cperiod = Day(5) + Hour(17) + Minute(35)
rperiod = reverse(cperiod)

@test rperiod.cperiod == cperiod

time_translation = canonical(Minute(-3600) + Second(22))
temporal_algebra = fldmod(time_translation)
@test (temporal_algebra - Day(temporal_algebra)) > Hour(12)

@test TimeUnits(Minute(10)+Microsecond(100)) == Microsecond(600000100)

@test Month(Year(3)+Month(2)) == Month(2)
@test hour(Day(5)+Hour(3)+Second(1)) == 3
