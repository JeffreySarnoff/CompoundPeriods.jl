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
    periodtypes = typesof(cperiod) 
    result = CompoundPeriod()
    if !isempty(findall(periodtypes .== Nanosecond))
        microseconds, nanoseconds = fldmod(Nanosecond(cperiod))
        result += nanoseconds
        cperiod += microseconds
    end
    if !isempty(findall(periodtypes .== Microsecond))
        milliseconds, microseconds = fldmod(Microsecond(cperiod))
        result += microseconds
        cperiod += milliseconds
    end    
    if !isempty(findall(periodtypes .== Millisecond))
        seconds, milliseconds = fldmod(Millisecond(cperiod))
        result += milliseconds
        cperiod += seconds
    end
    if !isempty(findall(periodtypes .== Second))
        minutes, seconds = fldmod(Second(cperiod))
        result += seconds
        cperiod += minutes
    end    
    if !isempty(findall(periodtypes .== Minute))
        hours, minutes = fldmod(Minute(cperiod))
        result += minutes
        cperiod += hours
    end    
    if !isempty(findall(periodtypes .== Hour))
       days, hours = fldmod(Hour(cperiod))
       result += hours
       cperiod += days
    end    
    days = Day(cperiod)
    result += days
    return result
end

    
