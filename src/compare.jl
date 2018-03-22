const Periodal = Union{Period, CompoundPeriod}

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
