const Day1 = Day(1)
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

function fldmod(cperiod::CompoundPeriod)
    cperiod = canonical(cperiod)
    periodtypes = typesof(cperiod)
    presentperiods = Set(periodtypes)
    result = CompoundPeriod()
    if Nanosecond in presentperiods
        microseconds, nanoseconds = fldmod(Nanosecond(cperiod))
        result += nanoseconds
        cperiod += microseconds
    end
    if Microsecond in presentperiods
        milliseconds, microseconds = fldmod(Microsecond(cperiod))
        result += microseconds
        cperiod += milliseconds
    end    
    if Millisecond in presentperiods
        seconds, milliseconds = fldmod(Millisecond(cperiod))
        result += milliseconds
        cperiod += seconds
    end
    if Second in presentperiods
        minutes, seconds = fldmod(Second(cperiod))
        result += seconds
        cperiod += minutes
    end    
    if Minute in presentperiods
        hours, minutes = fldmod(Minute(cperiod))
        result += minutes
        cperiod += hours
    end    
    if Hour in presentperiods
       days, hours = fldmod(Hour(cperiod))
       result += hours
       cperiod += days
    end    
    days = Day(cperiod)
    result += days
    return result
end

    
