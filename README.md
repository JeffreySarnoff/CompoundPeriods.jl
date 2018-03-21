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

julia> min(cperiod) == min(rperiod)
julia> minmax(cperiod), minmax(rperiod)

```

```julia
using Dates, CompoundPeriods

cperiod1 = Month(17) + Nanosecond(9876543210)
cperiod2 = Year(1) + Hour(98765)
c1plus2 = cperiod1 + cperiod2
c2minus1 = cperiod2 - cperiod1

canonical(cperiod1)
canonical(cperiod2)
canonical(c1plus2)
canonical(c2minus1)

adatetime = DateTime("2001-11-12T15:14:13.100")
adatetime + cperiod1
adatetime + cperiod2

```
