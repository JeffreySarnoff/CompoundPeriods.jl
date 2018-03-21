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
