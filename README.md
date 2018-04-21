## CompoundPeriods.jl
### Some enhancements for Dates.CompoundPeriod (Julia v0.7-)

#### Jeffrey Sarnoff &copy; 2018.&nbsp; This software is available for use under the MIT License.
-----

These examples show the enhanced capabilities.

```julia
julia> using Dates, CompoundPeriods

julia> cperiod = Day(2) - Hour(18) + Second(3605)
2 days, -18 hours, 3605 seconds

julia> Day(cperiod), Hour(cperiod), Second(cperiod)
(2 days, -18 hours, 3605 seconds)

julia> day(cperiod), hour(cperiod), second(cperiod)
(2, -18, 3605)

julia> cperiod = canonical(cperiod)
1 day, 7 hours, 5 seconds

julia> Day(cperiod), Hour(cperiod), Second(cperiod)
(1 day, 7 hours, 5 seconds)

julia> day(cperiod), hour(cperiod), second(cperiod)
(1, 7, 5)

julia> cperiod[1], cperiod[end]
1 day, 5 seconds
```

```julia
julia> using CompoundPeriods, Dates

julia> cperiod = Day(5) + Hour(17) + Minute(35)
5 days, 17 hours, 35 minutes

julia> rperiod = reverse(cperiod)
35 minutes, 17 hours, 5 days

julia> [typeof(aperiod) for aperiod in cperiod]
3-element Array{DataType,1}:
 Day   
 Hour  
 Minute
 
julia> result = [];

julia> for aperiod in rperiod
            push!(result,(aperiod, aperiod.value))
       end

julia> result
3-element Array{Any,1}:
 (35 minutes, 35)
 (17 hours, 17)  
 (5 days, 5)     
```

```julia
julia>  time_translation = canonical(Minute(-3600) + Second(22))
-2 days, -11 hours, -59 minutes, -38 seconds

julia> temporal_algebra = fldmod(time_translation)
-3 days, 12 hours, 22 seconds

julia> cperiod = canonical(Day(2)-Hour(18)+Second(3605))
1 day, 7 hours, 5 seconds

julia> Second(cperiod), Minute(cperiod), Hour(cperiod), Day(cperiod)
(5 seconds, 0 minutes, 7 hours, 1 day)

julia> Seconds(cperiod), Minutes(cperiod), Hours(cperiod), Days(cperiod)
(111605 seconds, 1860 minutes, 31 hours, 1 day)

julia> TimeUnits(Day(2)+Hour(12))
60 hours

julia> TimeUnits(Minute(10)+Microsecond(100))
600000100 microseconds
```

```julia
julia> using Dates, CompoundPeriods

julia> dyhr = Day(5) + Hour(79)
5 days, 79 hours

julia> dyhr = canonical(dyhr)
1 week, 1 day, 7 hours

julia> mnsc = canonical(Minute(-3600) + Second(22))
-2 days, -11 hours, -59 minutes, -38 seconds

julia> adatetime = DateTime("2004-03-02")
2004-03-02T00:00:00

julia> Time(adatetime) + Nanosecond(4321)
00:00:00.000004321

julia> adatetime + mnsc
2004-02-28T12:00:22
```

```julia
julia> using CompoundPeriods, Dates

julia> cperiod = Day(5) + Hour(17) + Minute(35)
5 days, 17 hours, 35 minutes

julia> rperiod = reverse(cperiod)
35 minutes, 17 hours, 5 days

julia> cperiod == reverse(rperiod)
true

julia> min(cperiod), max(rperiod)
(35 minutes, 5 days)

julia> minmax(cperiod) == minmax(rperiod)
true
```
```julia
julia> using Dates, CompoundPeriods

julia> dtm = DateTime("2011-02-04T10:11:12.345")
2011-02-04T10:11:12.345

julia> dt, tm = Date(dtm), Time(dtm)
(2011-02-04, 10:11:12.345)

julia> dt, CompoundPeriod(dt), dt == Date(CompoundPeriod(dt))
(2011-02-04, 2011 years, 2 months, 4 days, true)

julia> tm, CompoundPeriod(tm), tm == Time(CompoundPeriod(tm))
(10:11:12.345, 10 hours, 11 minutes, 12 seconds, 345 milliseconds, true)

julia> CompoundPeriod(dtm)
(2011 years, 2 months, 4 days, 10 hours, 11 minutes, 12 seconds, 345 milliseconds)

julia> dtm == DateTime(CompoundPeriod(dtm))
true
```
