export Identified, LeftIdentified, RightIdentitified, Unidentified,
       identification

"""
Trait to indicate that a binary operation • over set S indeed has an identity
element. Only methods of • with the signature •(x::S, y::S) are to be
considered.

That is to say, ``\exists I \in S. \forall x ∈ S. I \bullet x = x \bullet I =
x``. Note that an identity exists if and only if both left- and right-identities
exist (and if so, they are necessarily equal).
"""
abstract Identified

"""
Trait to indicate that a binary operation • over set S has a left-identity
element. Only methods of • with the signature •(x::S, y::S) are to be
considered.

That is to say, ``\exists I \in S. \forall x ∈ S. I \bullet x = x``. Note that
this trait does not imply that the left-identity could not be a right-identity
(and hence an identity element) also.
"""
abstract LeftIdentitified

"""
Trait to indicate that a binary operation • over set S has a right-identity
element. Only methods of • with the signature •(x::S, y::S) are to be
considered.

That is to say, ``\exists I \in S. \forall x ∈ S. x \bullet I = x``. Note that
this trait does not imply that the right-identity could not be a left-identity
(and hence an identity element) also.
"""
abstract RightIdentitified

"""
Trait to indicate that a binary operation • over set S is not known to have a
(possibly one-directional) identity element. Note that this trait does not imply
there there could not possibly be an identity element.
"""
abstract Unidentified

"""
Return the trait describing the existence of a full identity element of the set
S under the binary operation •.
"""
identification(::Type, ::Function) = WithoutIdentity

# Assume all number types have 0 and 1 (possibly bad assumption)
identification{T<:Number}(::Type{T}, ::typeof(+)) = Identified
identification{T<:Number}(::Type{T}, ::typeof(*)) = Identified

# Empty string is an identity element
identification(::Type{String}, ::typeof(*)) = Identified
