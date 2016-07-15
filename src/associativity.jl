export Associative, Nonassociative, associativity

"""
Trait to indicate that a binary operation • is associative over set S. Only
methods of • with the signature •(x::S, y::S) are to be considered.

That is to say, ``\forall x, y, z \in S. (x \bullet y) \bullet z = x \bullet (y
\bullet z)``. Note that in practice, this is not so absolute. Minor deviations
such as `Float64` arithmetic not being perfectly associative are allowed for
practical reasons.
"""
abstract Associative

"""
Trait to indicate that a binary operation • is not necessarily associative over
set S. Despite the name, this trait does not imply the existence of a
counterexample to associativity.
"""
abstract Nonassociative

"""
Return the associativity trait of the set S under the binary operation •.
"""
associativity(::Type, ::Function) = Nonassociative

# complex numbers are associative under + and *
# note that this is not in general true for arbitrary Numbers
associativity{N<:AbstractComplex}(::Type{N}, ::typeof(+)) = Associative
associativity{N<:AbstractComplex}(::Type{N}, ::typeof(*)) = Associative

# Strings are associative under *
associativity(::Type{String}, ::typeof(*)) = Associative
