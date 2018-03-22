function (==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
    mx, my = Months(x), Months(y)
    mx !== my && return false
   
    mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
    typ = plural(mintyp)
    xx = typ(x)
    yy = typ(y)
    xx.value == yy.value
end

function (!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
    mx, my = Months(x), Months(y)
    mx === my && return false
   
    mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
    typ = plural(mintyp)
    xx = typ(x)
    yy = typ(y)
    xx.value != yy.value
end


function (<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
    mx, my = Months(x), Months(y)
    mx < my && return true
    mx !== my && return false
   
    mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
    typ = plural(mintyp)
    xx = typ(x)
    yy = typ(y)
    xx.value < yy.value
end

function (<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
    mx, my = Months(x), Months(y)
    mx < my && return true
    mx > my && return false
   
    mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
    typ = plural(mintyp)
    xx = typ(x)
    yy = typ(y)
    xx.value <= yy.value
end

function (>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
    mx, my = Months(x), Months(y)
    mx > my && return true
    mx !== my && return false
   
    mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
    typ = plural(mintyp)
    xx = typ(x)
    yy = typ(y)
    xx.value > yy.value
end

function (>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period}
    mx, my = Months(x), Months(y)
    mx > my && return true
    mx < my && return false
   
    mintyp = Dates.periodisless(mintype(x)(1), P2(1)) ? mintype(x) : P2
    typ = plural(mintyp)
    xx = typ(x)
    yy = typ(y)
    xx.value >= yy.value
end


(Months(x) < Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) < Nanoseconds(y)))
(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) < Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) <= Nanoseconds(y)))
(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) > Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) > Nanoseconds(y)))
(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) > Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) >= Nanoseconds(y)))

Base.isless(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} = x == y
