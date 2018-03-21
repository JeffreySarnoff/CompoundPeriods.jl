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
