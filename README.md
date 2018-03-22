## CompoundPeriods.jl
### Some enhancements for Dates.CompoundPeriod

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

julia> cperiod == reverse(rperiod)
true

julia> min(cperiod), max(rperiod)
(22 seconds, 5 days)

julia> minmax(cperiod) == minmax(rperiod)
true
```

```julia
julia> using Dates, CompoundPeriods

julia> dyhr = Day(5) + Hour(79);

julia> mnsc = Minute(3600) + Second(22);

julia> showit( canonical(dyhr) )

	1 week, 1 day, 7 hours

julia> showit( canonical(mnsc) )

	2 days, 12 hours, 22 seconds

julia> adatetime = DateTime("2001-05-05")
2001-05-05T00:00:00

julia> adatetime + mnsc
2001-05-07T12:00:22

julia> adatetime + mnsc - dyhr
2001-04-29T05:00:22
```
