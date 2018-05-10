const Day1 = Day(1)
const Month1 = Month(1)
const Year1 = Year(1)

# exported interface to Dates.canonicalize and enhancements
canonical(x::CompoundPeriod) = canonicalize(x)
canonical(x::ReverseCompoundPeriod) = ReverseCompoundPeriod(canonicalize(x.cperiod))

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
    if 0 < x.value <= MONTHS_PER_YEAR
        x
    else
        canonical(Year1 + x) - Year1
    end
end


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

function fldmod(cperiod::CompoundPeriod)
    isempty(cperiod) && return cperiod
    cperiod_ymd   = Year(cperiod) + Month(cperiod) + Day(cperiod)
    cperiod_hours = cperiod - cperiod_ymd
    
    ymd = fldmod_years(cperiod_ymd)
    hrs = fldmod_hours(cperiod_hours)
    dy = Day(hrs)
    if length(ymd) > 0 && dy.value > 0
        dt = Date(ymd...,)
        dt += dy
        hrs -= dy
    end
    
    result = (ymd..., hrs...,)
    return result
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
    if dys < Day1
        dys -= Day1
    end
        
    return dys, hrs, mins, secs, millis, micros, nanos
end


function fldmod_days(cperiod::CompoundPeriod)
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
    if dys < Day1
        dys -= Day1
    end
    
    # tm = Time(hrs.value, mins.value, secs.value, millis.value, micros.value, nanos.value)
    
    dys += Day(cperiod)
    if dys < Day1
        dys -= Day1
    end
    
    return dys, hrs, mins, secs, millis, micros, nanos
end


function fldmod_years(cperiod::CompoundPeriod)    
    isempty(cperiod) && return cperiod
    yrs, mos = fldmod(Month(cperiod))
    yrs += Year(cperiod)
    if mos < Month1
        mos -= Month1
        ym = yrs+mos
        yrs, mos = Year(ym), Month(ym)
    end
    dys = Day(cperiod)
    dt = Date(yrs.value,1,1)
    dt = dt + mos
    dt = dt + dys
    
    dys = Day(dt)
    mos = Month(dt)
    yrs = Year(dt)
    
    return yrs, mos, dys
end


