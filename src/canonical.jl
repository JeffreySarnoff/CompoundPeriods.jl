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

canonical(x::Month) = 0 <= x.value < MONTHS_PER_YEAR ? x : sum(fldmod(x))

canonical(x::Hour) = 0 <= x.value < HOURS_PER_DAY ? x : sum(fldmod(x))

canonical(x::Minute) = 0 <= x.value < MINUTES_PER_HOUR ? x : sum(cannonical(fldmod1(x))
canonical(x::Second) = 0 <= x.value < SECONDS_PER_MINUTE ? x : sum(fldmod(x))
canonical(x::Millisecond) = 0 <= x.value < MILLISECONDS_PER_SECOND ? x : sum(fldmod(x))
canonical(x::Microsecond) = 0 <= x.value < MICROSECONDS_PER_MILLISECOND ? x : sum(fldmod(x))
canonical(x::Nanosecond) = 0 <= x.value < NANOSECONDS_PER_MICROSECOND ? x : sum(fldmod(x))

for (P,M) in ((:Hour, 24), (:Minute, 60), (:Second, 60), (:Millisecond, 1000), (:Microsecond, 1000), (:Nanosecond, 1000))
    @eval begin
        function canonical(x::$P)
            if 0 <= x.value < $M
                x
            else
                canonical(Day1 + x) - Day1
            end
        end
    end
end
            
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


@inline fldmod(x::Nanosecond) =
    map((f, x)->f(x), (Microsecond,Nanosecond), fldmod(x.value, NANOSECONDS_PER_MICROSECOND))
@inline fldmod(x::Microsecond) =
    map((f, x)->f(x), (Millisecond,Microsecond), fldmod(x.value, MICROSECONDS_PER_MILLISECOND))
@inline fldmod(x::Millisecond) =
    map((f, x)->f(x), (Second,Millisecond), fldmod(x.value, MILLISECONDS_PER_SECOND))
@inline fldmod(x::Second) =
    map((f, x)->f(x), (Minute,Second), fldmod(x.value, SECONDS_PER_MINUTE))
@inline fldmod(x::Minute) =
    map((f, x)->f(x), (Hour,Minute), fldmod(x.value, MINUTES_PER_HOUR))
@inline fldmod(x::Hour) =
    map((f, x)->f(x), (Day, Hour), fldmod(x.value, HOURS_PER_DAY))
@inline fldmod(x::Day) = x
@inline fldmod(x::Month) =
    map((f, x)->f(x), (Year, Month), fldmod(x.value, MONTHS_PER_YEAR))
@inline fldmod(x::Year) = x

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
