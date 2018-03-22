fldmod(x::Nanosecond) =
    map((f, x)->f(x), (Microsecond,Nanosecond), fldmod(x.value, NANOSECONDS_PER_MICROSECOND))
fldmod(x::Microsecond) =
    map((f, x)->f(x), (Millisecond,Microsecond), fldmod(x.value, MICROSECONDS_PER_MILLISECOND))
fldmod(x::Millisecond) =
    map((f, x)->f(x), (Second,Millisecond), fldmod(x.value, MILLISECONDS_PER_SECOND))
fldmod(x::Second) =
    map((f, x)->f(x), (Minute,Second), fldmod(x.value, SECONDS_PER_MINUTE))
fldmod(x::Minute) =
    map((f, x)->f(x), (Hour,Minute), fldmod(x.value, MINUTES_PER_HOUR))
fldmod(x::Hour) =
    map((f, x)->f(x), (Day, Hour), fldmod(x.value, HOURS_PER_DAY))
fldmod(x::Day) = x

function fldmod(cperiod::CompoundPeriod)
    result = CompoundPeriod()
    microseconds, nanoseconds = fldmod(Nanosecond(cperiod))
    result += nanoseconds
    cperiod += microseconds
    milliseconds, microseconds = fldmod(Microsecond(cperiod))
    result += microseconds
    cperiod += milliseconds
    seconds, milliseconds = fldmod(Millisecond(cperiod))
    result += milliseconds
    cperiod += seconds
    minutes, seconds = fldmod(Second(cperiod))
    result += seconds
    cperiod += minutes
    hours, minutes = fldmod(Minute(cperiod))
    result += minutes
    cperiod += hours
    days, hours = fldmod(Hour(cperiod))
    result += hours
    cperiod += days
    days = Day(cperiod)
    result += days
    return result
end

    
