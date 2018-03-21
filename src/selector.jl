for P in (:Year, :Month, :Day, :Hour, :Minute, :Second,
          :Millsecond, :Microsecond, :Nanosecond)
  @eval begin
     function $P(x::CompoundPeriod)
         typs = typesof(x)
         idx = findall(typs .=== $P)
         isempty(idx) && return $P(0)
         return x.periods[idx[1]]
     end
  end
end

function canonical(days::Day, hours::Hour=Hour(0), minutes::Minute=Minute(0), seconds::Second=Second(0), millisecs::Millisecond=Millisecond(0), microsecs::Microsecond=Microsecond(0), nanosecs::Nanosecond=Nanosecond(0))
    CompoundPeriod(Day(days), Hour(hours), minutes, seconds, millisecs, microsecs, nanosecs)
end
function canonical(hours::Hour, minutes::Minute=Minute(0), seconds::Second=Second(0), millisecs::Millisecond=Millisecond(0), microsecs::Microsecond=Microsecond(0), nanosecs::Nanosecond=Nanosecond(0))
    days, hours = fldmod(hours.value, 24)
    CompoundPeriod(Day(days), Hour(hours), minutes, seconds, millisecs, microsecs, nanosecs)
end
function canonical(minutes::Minute, seconds::Second=Second(0), millisecs::Millisecond=Millisecond(0), microsecs::Microsecond=Microsecond(0), nanosecs::Nanosecond=Nanosecond(0))
    hours, mins = fldmod(minutes.value, 60)
    canonical(Hour(hours), Minute(mins), seconds, millisecs, microsecs, nanosecs)
end
function canonical(seconds::Second, millisecs::Millisecond=Millisecond(0), microsecs::Microsecond=Microsecond(0), nanosecs::Nanosecond=Nanosecond(0))
    mins, secs = fldmod(seconds.value, 60)
    canonical(Minute(mins), Second(secs), millisecs, microsecs, nanosecs)
end
function canonical(millisecs::Millisecond, microsecs::Microsecond=Microsecond(0), nanosecs::Nanosecond=Nanosecond(0))
    secs, millis = fldmod(millisecs.value, 1_000)
    canonical(Second(secs), Millisecond(millis), microsecs, nanosecs)
end
function canonical(microsecs::Microsecond, nanosecs::Nanosecond=Nanosecond(0))
    millis, micros = fldmod(microsecs.value, 1_000)
    canonical(Millisecond(millis), Microsecond(micros), nanosecs)
end
function canonical(x::Nanosecond)
    micros, nanos = fldmod(x.value, 1_000)
    canonical(Microsecond(micros), Nanosecond(nanos))
end


function canonical(x::CompoundPeriod)
    periods = x.periods
    periods = map(canonical, periods)
    compound = isempty(periods) ? CompoundPeriod() : reduce(+, periods)
    # repeat to roll up any period multiplicties
    periods = compound.periods
    periods = map(canonical, periods)
    compound = isempty(periods) ? CompoundPeriod() : reduce(+, periods)
    return compound
end

canonical(x::Period) = canonical(CompoundPeriod(x))


function isolate_days(cperiod::CompoundPeriod)
    days = Day(cperiod)
    cperiod = cperiod - days
    return days, cperiod
end

function isolate_yearsmonths(cperiod::CompoundPeriod)
    years = Year(cperiod)
    months = Month(cperiod)
    cperiod = cperiod - years
    cperiod = cperiod - months
    yearsmonths = years + months
    return yearsmonths, cperiod  
end

function isolate_yearsmonths_days(cperiod::CompoundPeriod)
    yearsmonths, cperiod = isolate_yearsmonths(cperiod)
    days, cperiod = isolate_days(cperiod)
    return yearsmonths, days, cperiod
end

function isolate_yearsmonthsdays(cperiod::CompoundPeriod)
    yearsmonths, cperiod = isolate_yearsmonths(cperiod)
    days, cperiod = isolate_days(cperiod)
    return yearsmonths+days, cperiod
end
