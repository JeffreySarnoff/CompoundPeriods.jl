Base.:(==)(::Type{P}, ::Type{P}) where {P<:Period} = true
Base.:(!=)(::Type{P}, ::Type{P}) where {P<:Period} = false
Base.:(<)(::Type{P}, ::Type{P}) where {P<:Period} = false
Base.:(<=)(::Type{P}, ::Type{P}) where {P<:Period} = true
Base.:(>)(::Type{P}, ::Type{P}) where {P<:Period} = false
Base.:(>=)(::Type{P}, ::Type{P}) where {P<:Period} = true

Base.:(==)(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = false
Base.:(!=)(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = true
Base.:(<)(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = P1(1) < P2(1)
Base.:(<=)(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = P1(1) < P2(1)
Base.:(>)(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = P1(1) > P2(1)
Base.:(>=)(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = P1(1) > P2(1)

Base.isless(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = P1(1) < P2(1)
Base.isequal(::Type{P1}, ::Type{P2}) where {P1<:Period, P2<:Period} = P1(1) == P2(1)

Base.:(==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:Period} = x == y

Base.:(==)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:Period} = x == y

Base.:(==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:CompoundPeriod} = x < y
Base.isequal(x::P1, y::P2) where {P1<:CompoundPeriod, P2<CompoundPeriod} = x == y



Base.:(==)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:Period} = x == y

Base.:(==)(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} = x < y
Base.isequal(x::P1, y::P2) where {P2<:ReverseCompoundPeriod, P1<:Period} = x == y

Base.:(==)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<:ReverseCompoundPeriod} = x < y
Base.isequal(x::P1, y::P2) where {P1<:ReverseCompoundPeriod, P2<ReverseCompoundPeriod} = x == y



Base.:(==)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P1<:CompoundPeriod, P2<:ReverseCompoundPeriod} = x < y
Base.isequal(x::P1, y::P2) where {P1<:CompoundPeriod, P2<ReverseCompoundPeriod} = x == y




Base.:(==)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} =
    Months(x) == Months(y) && Nanoseconds(x) == Nanoseconds(y)
Base.:(!=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} =
    Months(x) != Months(y) || Nanoseconds(x) != Nanoseconds(y)
Base.:(<)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) < Nanoseconds(y))
Base.:(<=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} =
    Months(x) < Months(y) || (Months(x) == Months(y) && Nanoseconds(x) <= Nanoseconds(y))
Base.:(>)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) > Nanoseconds(y))
Base.:(>=)(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} =
    Months(x) > Months(y) || (Months(x) == Months(y) && Nanoseconds(x) >= Nanoseconds(y))

Base.isless(x::P1, y::P2) where {P2<:CompoundPeriod, P1<:ReverseCompoundPeriod} = x < y
Base.isequal(x::P1, y::P2) where {P2<:CompoundPeriod, P1<ReverseCompoundPeriod} = x == y

