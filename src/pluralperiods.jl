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
Seconds(x::CompoundPeriod) = sum(map(Second, x.periods))
Seconds(x::ReverseCompoundPeriod) = sum(map(Second, x.cperiod.periods))

Minutes(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second}} = floor(x, Minute)
Minutes(x::T) where {T<:Period} = Minute(x)
Minutes(x::CompoundPeriod) = sum(map(Minute, x.periods))
Minutes(x::ReverseCompoundPeriod) = sum(map(Minute, x.cperiod.periods))

Hours(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute}} = floor(x, Hour)
Hours(x::T) where {T<:Period} = Hour(x)
Hours(x::CompoundPeriod) = sum(map(Hour, x.periods))
Hours(x::ReverseCompoundPeriod) = sum(map(Hour, x.cperiod.periods))

Days(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour}} = floor(x, Day)
Days(x::T) where {T<:Period} = Day(x)
Days(x::CompoundPeriod) = sum(map(Day, x.periods))
Days(x::ReverseCompoundPeriod) = sum(map(Day, x.cperiod.periods))


