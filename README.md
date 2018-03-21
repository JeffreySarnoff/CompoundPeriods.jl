## CompoundPeriods.jl
### Some enhancements for Dates.CompoundPeriod

#### Jeffrey Sarnoff &copy; 2018.&nbsp; This software is available for use under the MIT License.
-----

These examples show the enhanced capabilities.

```julia
using CompoundPeriods, Dates

showit(xs...) = print("\n\t", join(map(string,(xs...,)),", "), "\n")

cperiod = Day(5) + Hour(17) + Minute(35) + Second(22);

showit(cperiod)
showit( cperiod[1], cperiod[end] )

rperiod = reverse(cperiod);

showit(rperiod)
showit( rperiod[1], rperiod[end] )


cperiod == reverse(rperiod)
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
```
