
(==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) == Months(y)) && (Nanoseconds(x) == Nanoseconds(y))
(!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) != Months(y)) || (Nanoseconds(x) != Nanoseconds(y))
(<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) < Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) < Nanoseconds(y)))
(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) < Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) <= Nanoseconds(y)))
(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) > Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) > Nanoseconds(y)))
(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    (Months(x) > Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) >= Nanoseconds(y)))

Base.isless(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} = x == y

(==)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    (Months(x) == Months(y)) && (Nanoseconds(x) == Nanoseconds(y))
(!=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    (Months(x) != Months(y)) || (Nanoseconds(x) != Nanoseconds(y))
(<)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    (Months(x) < Months(y)) || ()Months(x) == Months(y)) && (Nanoseconds(x) < Nanoseconds(y)))
(<=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    (Months(x) < Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) <= Nanoseconds(y)))
(>)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    (Months(x) > Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) > Nanoseconds(y)))
(>=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    (Months(x) > Months(y)) || ((Months(x) == Months(y)) && (Nanoseconds(x) >= Nanoseconds(y)))

Base.isless(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} = x == y

#=
(==)(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
(!=)(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
(<)(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
(<=)(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
(>)(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
(>=)(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

isless(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} = x < y
isequal(x::P1, y::P2) where {P1<:Periodal, P2<:Periodal} = x == y
=#1
