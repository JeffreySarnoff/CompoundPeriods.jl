function Base.:(==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod}
    return Base.:(==)(canonical(x), canonical(y))
end
function Base.:(!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod}
    return Base.:(!=)(canonical(x), canonical(y))
end

function Base.:(<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod}
    cx, cy = canonical(x), canonical(y)
    xmonths, ymonths = Months(cx), Months(cy)
    xsecs, ysecs = Seconds(cx), Seconds(cy)
    xnanos, ynanos = Nanoseconds(x-xsecs), Nanoseconds(y-ysecs)
    return xmonths < ymonths || (xmonths == ymonths && (xsecs < ysecs || (xsecs == ysecs && xnanos < ynanos)))
end

function Base.:(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod}
    cx, cy = canonical(x), canonical(y)
    xmonths, ymonths = Months(cx), Months(cy)
    xsecs, ysecs = Seconds(cx), Seconds(cy)
    xnanos, ynanos = Nanoseconds(x-xsecs), Nanoseconds(y-ysecs)
    return xmonths > ymonths || (xmonths == ymonths && (xsecs > ysecs || (xsecs == ysecs && xnanos > ynanos)))
end

function Base.:(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod}
    cx, cy = canonical(x), canonical(y)
    xmonths, ymonths = Months(cx), Months(cy)
    xsecs, ysecs = Seconds(cx), Seconds(cy)
    xnanos, ynanos = Nanoseconds(x-xsecs), Nanoseconds(y-ysecs)
    return xmonths < ymonths || (xmonths == ymonths && (xsecs < ysecs || (xsecs == ysecs && xnanos <= ynanos)))
end

function Base.:(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod}
    cx, cy = canonical(x), canonical(y)
    xmonths, ymonths = Months(cx), Months(cy)
    xsecs, ysecs = Seconds(cx), Seconds(cy)
    xnanos, ynanos = Nanoseconds(x-xsecs), Nanoseconds(y-ysecs)
    return xmonths > ymonths || (xmonths == ymonths && (xsecs > ysecs || (xsecs == ysecs && xnanos >= ynanos)))
end

function Base.:(==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
  mx, my = Months(x), Months(y)
  mx !== my && return false

  mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
  typ = plural(mintyp)
  xx = typ(x)
  yy = typ(y)
  xx.value == yy.value
end

function Base.:(!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
  mx, my = Months(x), Months(y)
  mx === my && return false

  mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
  typ = plural(mintyp)
  xx = typ(x)
  yy = typ(y)
  xx.value != yy.value
end

function Base.:(<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
  mx, my = Months(x), Months(y)
  mx < my && return true
  mx !== my && return false

  mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
  typ = plural(mintyp)
  xx = typ(x)
  yy = typ(y)
  xx.value < yy.value
end

function Base.:(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
  mx, my = Months(x), Months(y)
  mx < my && return true
  mx > my && return false

  mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
  typ = plural(mintyp)
  xx = typ(x)
  yy = typ(y)
  xx.value <= yy.value
end

function Base.:(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
  mx, my = Months(x), Months(y)
  mx > my && return true
  mx !== my && return false

  mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
  typ = plural(mintyp)
  xx = typ(x)
  yy = typ(y)
  xx.value > yy.value
end

function Base.:(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
  mx, my = Months(x), Months(y)
  mx > my && return true
  mx < my && return false

  mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
  typ = plural(mintyp)
  xx = typ(x)
  yy = typ(y)
  xx.value >= yy.value
end

const PeriodTypes = (:Year, :Month, :Week, :Day, :Hour, :Minute, :Second, :Millisecond, :Microsecond, :Nanosecond)

for P in PeriodTypes
    @eval Base.isless(::Type{$P}, ::Type{$P}) = false
    @eval Base.isequal(::Type{$P}, ::Type{$P}) = true
end
for idx1 in 1:(length(PeriodTypes)-1)
    P1 = PeriodTypes[idx1]
    for idx2 in (idx1+1):length(PeriodTypes)
        P2 = PeriodTypes[idx2]
        @eval Base.isless(::Type{$P2}, ::Type{$P1}) = true
        @eval Base.isless(::Type{$P1}, ::Type{$P2}) = false
        @eval Base.isequal(::Type{$P2}, ::Type{$P1}) = false
        @eval Base.isequal(::Type{$P1}, ::Type{$P2}) = false
    end
end
