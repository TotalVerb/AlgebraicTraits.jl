using AlgebraicTraits
using Base.Test

@test ismonoid(String, *)
@test !ismonoid(String, +)

@test ismonoid(Int, +)
@test ismonoid(Int, *)
