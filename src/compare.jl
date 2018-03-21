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

