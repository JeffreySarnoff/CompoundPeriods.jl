## CompoundPeriods.jl
### Some enhancements for Dates.CompoundPeriod

----

#### Copyright ©&thinsp;2018 by Jeffrey Sarnoff. &nbsp;&nbsp; Released under The MIT License.

-----

[![Docs Latest](https://img.shields.io/badge/docs-latest-blue.svg)](http://jeffreysarnoff.github.io/CompoundPeriods.jl/latest/)

 
-----
This package enhances the CompoundPeriod type defined within Dates (Dates.CompoundPeriod). A CompoundPeriod is formed by attaching (adding) two or more distinct Periods:

```julia
julia> using Dates

julia> typeof( Year(1999) ), typeof( Hour(15) )
Year, Hour

julia> typeof( Year(1999) + Hour(15) )
Dates.CompoundPeriod
```

Note that `typeof( compound_period )` is shown as `CompoundPeriod` rather than `Dates.CompoundPeriod`. This lets you know that enhanced CompoundPeriods are in use.
 
```julia
julia> using CompoundPeriods, Dates

julia> typeof( Year(1999) + Hour(15) )
CompoundPeriod
```
