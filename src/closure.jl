export Closed, Partial, Open, closure

"""
Trait to indicate that a binary operation • is closed over set S. Only methods
of • with the signature •(x::S, y::S) are to be considered.

The definition of closed is that •(x::S, y::S) shall not throw an error, and
•(x::S, y::S) shall return a result of type S.
"""
abstract Closed

"""
Trait to indicate that a binary operation • is a partial function over set S.
Only methods of • with the signature •(x::S, y::S) are to be considered.

The definition of a partial function in this context is that •(x::S, y::S) shall
either throw an error or return a result of type S.
"""
abstract Partial

"""
Trait to indicate that a binary operation • is not known to be closed or to be a
partial function over set S. Note that this trait does not imply the existence
of a counterexample to closure.
"""
abstract Open

"""
Return the closure trait of the set S under the binary operation •.
"""
closure(::Type, ::Function) = Open

# numbers should be closed under + and *
closure{N<:Number}(::Type{N}, ::typeof(+)) = Closed
closure{N<:Number}(::Type{N}, ::typeof(*)) = Closed

# Strings are closed under *
closure(::Type{String}, ::typeof(*)) = Closed
