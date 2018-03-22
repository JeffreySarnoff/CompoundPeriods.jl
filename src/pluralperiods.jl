Nanoseconds(x::Period) = Nanosecond(x)
Nanoseconds(x::CompoundPeriod) = sum(map(Nanosecond, x.periods))
Nanoseconds(x::ReverseCompoundPeriod) = sum(map(Nanosecond, x.cperiod.periods))

Microseconds(x::T) where {T<:Nanosecond} = floor(x, Microsecond)
Microseconds(x::T) where {T<:Period} = Microsecond(x)
Microseconds(x::CompoundPeriod) = sum(map(Microsecond, x.periods))
Microseconds(x::ReverseCompoundPeriod) = sum(map(Microsecond, x.cperiod.periods))

Milliseconds(x::T) where {T<:Union{Nanosecond, Microsecond}} = floor(x, Millisecond)
Milliseconds(x::T) where {T<:Period} = Millisecond(x)
Milliseconds(x::CompoundPeriod) = sum(map(Millisecond, x.periods))
Milliseconds(x::ReverseCompoundPeriod) = sum(map(Millisecond, x.cperiod.periods))

Seconds(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond}} = floor(x, Second)
Seconds(x::T) where {T<:Period} = Second(x)
Seconds(x::CompoundPeriod) = Second(sum(map(mintype(x), x.periods)))
Seconds(x::ReverseCompoundPeriod) = Second(sum(map(mintype(x), x.cperiod.periods)))

Minutes(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second}} = floor(x, Minute)
Minutes(x::T) where {T<:Period} = Minute(x)
Minutes(x::CompoundPeriod) = Minute(sum(map(mintype(x), x.periods)))
Minutes(x::ReverseCompoundPeriod) = Minute(sum(map(mintype(x), x.cperiod.periods)))

Hours(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute}} = floor(x, Hour)
Hours(x::T) where {T<:Period} = Hour(x)
Hours(x::CompoundPeriod) = Hour(sum(map(mintype(x), x.periods)))
Hours(x::ReverseCompoundPeriod) = Hour(sum(map(mintype(x), x.cperiod.periods)))

Days(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour}} = floor(x, Day)
Days(x::T) where {T<:Period} = Day(x)
Days(x::CompoundPeriod) = Day(sum(map(mintype(x), x.periods)))
Days(x::ReverseCompoundPeriod) = Day(sum(map(mintype(x), x.cperiod.periods)))

Months(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, Day}} = Month(0)
Months(x::T) where {T<:Year} = floor(x, Month)
Months(x::T) where {T<:Period} = Month(x)
Months(x::CompoundPeriod) = sum(map(Month, x.periods))
Months(x::ReverseCompoundPeriod) = sum(map(Month, x.cperiod.periods))

Years(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, Day}} = Year(0)
Years(x::T) where {T<:Month} = floor(x, Year)
Years(x::T) where {T<:Period} = Year(x)
Years(x::CompoundPeriod) = sum(map(Year, x.periods))
Years(x::ReverseCompoundPeriod) = sum(map(Year, x.cperiod.periods))

TimeUnits(x::CompoundPeriod) = sum(map(mintype(x), x.periods))
TimeUnits(x::ReverseCompoundPeriod) = sum(map(mintype(x), x.cperiod.periods))
TimeUnits(x::Period) = x

