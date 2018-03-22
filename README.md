## CompoundPeriods.jl
### Some enhancements for Dates.CompoundPeriod (Julia v0.7-)

#### Jeffrey Sarnoff &copy; 2018.&nbsp; This software is available for use under the MIT License.
-----

These examples show the enhanced capabilities.

```julia
julia> using CompoundPeriods, Dates

julia> showit(xs...) = print("\n\t", join(map(string,(xs...,)),", "), "\n");

julia> cperiod = Day(5) + Hour(17) + Minute(35) + Second(22);

julia> showit(cperiod)

	5 days, 17 hours, 35 minutes, 22 seconds

julia> showit( cperiod[1], cperiod[end] )

	5 days, 22 seconds

julia> rperiod = reverse(cperiod);

julia> showit(rperiod)

	22 seconds, 35 minutes, 17 hours, 5 days

julia> showit( rperiod[1], rperiod[end] )

	22 seconds, 5 days
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

