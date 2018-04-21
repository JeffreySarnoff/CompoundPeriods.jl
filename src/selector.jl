for P in (:Year, :Month, :Week, :Day, :Hour, :Minute, :Second,
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

for (P,Q) in ((:Year, :year), (:Month, :month), (:Week, :week), (:Day, :day),
              (:Hour, :hour), (:Minute, :minute), (:Second, :second),
              (:Millisecond, :millisecond), (:Microsecond, :microsecond),
              (:Nanosecond, :nanosecond))
  @eval begin
     function $Q(x::CompoundPeriod)
         typs = typesof(x)
         idx = findall(typs .=== $P)
         isempty(idx) && return 0
         return x.periods[idx[1]].value
     end
  end
end

convert(::Type{Year}, x::T) where {T<:Diurnal} = Year(0)
convert(::Type{Month}, x::T) where {T<:Diurnal} = Month(0)
convert(::Type{T}, x::Year) where {T<:Diurnal} = T(0)
convert(::Type{T}, x::Month) where {T<:Diurnal} = T(0)


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
