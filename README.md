## CompoundPeriods.jl
### Some enhancements for Dates.CompoundPeriod

#### Jeffrey Sarnoff &copy; 2018.&nbsp; This software is available for use under the MIT License.
-----

These examples show the enhanced capabilities.

```julia
using CompoundPeriods, Dates

cperiod = Day(5) + Hour(17) + Minute(35) + Second(22)

print("\n\t", cperiod)

cperiod[1], cperiod[2], cperiod[end]

rperiod = reverse(cperiod)

print("\n\t", rperiod)

rperiod[1], rperiod[2], rperiod[end]

cperiod == reverse(rperiod)
```
