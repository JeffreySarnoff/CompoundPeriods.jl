plural(::Type{Nanosecond}) = Nanoseconds
plural(::Type{Microsecond}) = Microseconds
plural(::Type{Millisecond}) = Milliseconds
plural(::Type{Second}) = Seconds
plural(::Type{Minute}) = Minutes
plural(::Type{Hour}) = Hours
plural(::Type{Day}) = Days
plural(::Type{Month}) = Months
plural(::Type{Year}) = Years
plural(::Type{Nanoseconds}) = Nanoseconds
plural(::Type{Microseconds}) = Microseconds
plural(::Type{Milliseconds}) = Milliseconds
plural(::Type{Seconds}) = Seconds
plural(::Type{Minutes}) = Minutes
plural(::Type{Hours}) = Hours
plural(::Type{Days}) = Days
plural(::Type{Months}) = Months
plural(::Type{Years}) = Years

singular(::Type{Nanoseconds}) = Nanosecond
singular(::Type{Microseconds}) = Microsecond
singular(::Type{Milliseconds}) = Millisecond
singular(::Type{Seconds}) = Second
singular(::Type{Minutes}) = Minute
singular(::Type{Hours}) = Hour
singular(::Type{Days}) = Day
singular(::Type{Months}) = Month
singular(::Type{Years}) = Year
singular(::Type{Nanosecond}) = Nanosecond
singular(::Type{Microsecond}) = Microsecond
singular(::Type{Millisecond}) = Millisecond
singular(::Type{Second}) = Second
singular(::Type{Minute}) = Minute
singular(::Type{Hour}) = Hour
singular(::Type{Day}) = Day
singular(::Type{Month}) = Month
singular(::Type{Year}) = Year


Nanoseconds(x::Period) = Nanosecond(x)
Nanoseconds(x::CompoundPeriod) = sum(map(Nanosecond, x.periods))
Nanoseconds(x::ReverseCompoundPeriod) = sum(map(Nanosecond, x.cperiod.periods))

TimeUnits(x::CompoundPeriod) = sum(map(mintype(x), x.periods))
TimeUnits(x::ReverseCompoundPeriod) = sum(map(mintype(x), x.cperiod.periods))
TimeUnits(x::Period) = x

Microseconds(x::T) where {T<:Nanosecond} = floor(x, Microsecond)
Microseconds(x::T) where {T<:Period} = Microsecond(x)
Microseconds(x::T) where {T<:Periodous} = Microseconds(TimeUnits(x))

Milliseconds(x::T) where {T<:Union{Nanosecond, Microsecond}} = floor(x, Millisecond)
Milliseconds(x::T) where {T<:Period} = Millisecond(x)
Milliseconds(x::T) where {T<:Periodous} = Milliseconds(TimeUnits(x))

Seconds(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond}} = floor(x, Second)
Seconds(x::T) where {T<:Period} = Second(x)
Seconds(x::T) where {T<:Periodous} = Seconds(TimeUnits(x))

Minutes(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second}} = floor(x, Minute)
Minutes(x::T) where {T<:Period} = Minute(x)
Minutes(x::T) where {T<:Periodous} = Minutes(TimeUnits(x))

Hours(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute}} = floor(x, Hour)
Hours(x::T) where {T<:Period} = Hour(x)
Hours(x::T) where {T<:Periodous} = Hours(TimeUnits(x))

Days(x::T) where {T<:Union{Nanosecond, Microsecond, Millisecond, Second, Minute, Hour}} = floor(x, Day)
Days(x::T) where {T<:Period} = Day(x)
Days(x::T) where {T<:Periodous} = Days(TimeUnits(x))

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


