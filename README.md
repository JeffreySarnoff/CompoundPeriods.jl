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
