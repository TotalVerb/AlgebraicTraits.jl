module AlgebraicTraits

# useful because Complex is a leaf type in Julia
typealias AbstractComplex Union{Real, Complex}

include("associativity.jl")
include("closure.jl")
include("identity.jl")

include("monoid.jl")

end  # module AlgebraicTraits
