const CompoundPeriodZero = Nanosecond(0)

const Day1   = Day(1)
const Week1  = Week(1)
const Month1 = Month(1)
const Year1  = Year(1)

cannonical(x::Year) = x
cannonical(x::Week) = x
cannonical(x::Day)  = x

fldmod1(x::Int64, y::Month) = (Year(x), y)
fldmod1(x::Int64, y::Day) = (Week(x), y)
fldmod1(x::Int64, y::Hour) = (Day(x), y)
fldmod1(x::Int64, y::Minute) = (Hour(x), y)
fldmod1(x::Int64, y::Second) = (Minute(x), y)
fldmod1(x::Int64, y::Millisecond) = (Second(x), y)
fldmod1(x::Int64, y::Microsecond) = (Millisecond(x), y)
fldmod1(x::Int64, y::Nanosecond) = (Microsecond(x), y)

fldmod(x::Year) = x
fldmod(x::Month) = fldmod1(fldmod(x, Month(MONTHS_PER_YEAR))...,)
fldmod(x::Week) = x
fldmod(x::Day) = fldmod1(fldmod(x, Day(DAYS_PER_WEEK))...,)
fldmod(x::Hour) = fldmod1(fldmod(x, Hour(HOURS_PER_DAY))...,)
fldmod(x::Minute) = fldmod1(fldmod(x, Minute(MINUTES_PER_HOUR))...,)
fldmod(x::Second) = fldmod1(fldmod(x, Second(SECONDS_PER_MINUTE))...,)
fldmod(x::Millisecond) = fldmod1(fldmod(x, Millisecond(MILLISECONDS_PER_SECOND))...,)
fldmod(x::Microsecond) = fldmod1(fldmod(x, Microsecond(MICROSECONDS_PER_MILLISECOND))...,)
fldmod(x::Nanosecond) = fldmod1(fldmod(x, Millisecond(NANOSECONDS_PER_MICROSECOND))...,)

function canonical(x::Nanosecond)
    result = fldmod(x)
    result = (fldmod(result[1])..., result[2])
    result = (fldmod(result[1])..., result[2:end]...,)
    result = (fldmod(result[1])..., result[2:end]...,)
    result = (fldmod(result[1])..., result[2:end]...,)
    result = (fldmod(result[1])..., result[2:end]...,)
    return sum(result)
end

function canonical(x::Microsecond)
    result = fldmod(x)
    result = (fldmod(result[1])..., result[2])
    result = (fldmod(result[1])..., result[2:end]...,)
    result = (fldmod(result[1])..., result[2:end]...,)
    result = (fldmod(result[1])..., result[2:end]...,)
    return sum(result)
end

function canonical(x::Millisecond)
    result = fldmod(x)
    result = (fldmod(result[1])..., result[2])
    result = (fldmod(result[1])..., result[2:end]...,)
    result = (fldmod(result[1])..., result[2:end]...,)
    return sum(result)
end

function canonical(x::Second; weeks::Bool=false)
    result = fldmod(x)
    result = (fldmod(result[1])..., result[2])
    result = (fldmod(result[1])..., result[2:end]...,)
    if weeks
        result = (fldmod(result[1])..., result[2:end]...,)
    end
    return sum(result)
end

function canonical(x::Minute; weeks::Bool=false)
    result = fldmod(x)
    result = (fldmod(result[1])..., result[2])
    if weeks
        result = (fldmod(result[1])..., result[2:end]...,)
    end
    return sum(result)
end

function canonical(x::Hour; weeks::Bool=false)
    result = fldmod(x)
    if weeks
        result = (fldmod(result[1])..., result[2:end]...,)
    end       
    return sum(result)
end

fuction canonical(x::Day; weeks::Bool=false)
    weeks ? sum(fldmod(x)) : x
end
    
canonical(x::Week) = x

function canonical(x::Month)
    result = fldmod(x)
    return sum(result)
end

canonical(x::Year) = x
# exported interface to Dates.canonicalize and enhancements
function canonical(x::Month) 
    if 0 <= x.value < MONTHS_PER_YEAR
        x
    else
        canonical(Year1 + x) - Year1 - Day1
    end
end

canonical(x::Year) = x

function canonical(cperiod::ReverseCompoundPeriod)
    result = CompoundPeriod()
    for p in cperiod
        result = (result + sum(fldmod(p)))
    end
    return sum(fldmod(sum(result)))
end

canonical(cperiod::CompoundPeriod) =
    !isempty(cperiod) ? canonical(reverse(cperiod)) : CompoundPeriodZero

@inline function fldmod(yr::Year, mo::Month)
    y, mo = fldmod(mo)
    yr += y
    return yr, mo
end

@inline function fldmod(yr::Year, mo::Month, dy::Day)
    yr, mo = fldmod(yr, mo)
    ymd = Date(yr.value, mo.value, 1) + dy
    return Year(ymd), Month(ymd), Day(ymd)
end

function fldmod(cperiod::CompoundPeriod)
    isempty(cperiod) && return cperiod
    maxtype = typeof(max(cperiod))
    mintype = typeof(min(cperiod))
    if maxtype <= Hour
        fldmod_hours(cperiod)
    elseif maxtype <= Day
        dy = Day(cperiod)
        dy += sum(fldmod_hours(cperiod - dy))
    elseif maxtype == Year
        ymd = sum(fldmod(Year(cperiod), Month(cperiod), Day(cperiod)))
        if mintype < Day
            cperiod2 = cperiod - ymd
            hms = fldmod_hours(cperiod2)
            dy = hms[1]
            hms = hms[2:end]
            ymd = CompoundPeriod(Date(ymd...,) + dy)
            ymd + sum(hms)
        else
            sum(ymd)
        end
    else
        throw(ErrorException(DomainError(string("fldmod expects Year, or maxtype of Day ($cperiod)"))))
    end
end

function fldmod_hours(cperiod::CompoundPeriod)
    isempty(cperiod) && return cperiod
    result = CompoundPeriod()
    micros, nanos = fldmod(Nanosecond(cperiod))
    micros += Microsecond(cperiod)
    millis, micros = fldmod(micros)
    millis += Millisecond(cperiod)
    secs, millis = fldmod(millis)
    secs += Second(cperiod)
    mins, secs = fldmod(secs)
    mins += Minute(cperiod)
    hrs, mins = fldmod(mins)
    hrs += Hour(cperiod)
    dys, hrs = fldmod(hrs)
        
    return dys, hrs, mins, secs, millis, micros, nanos
end
