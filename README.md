# AlgebraicTraits

[![Build Status](https://travis-ci.org/TotalVerb/AlgebraicTraits.jl.svg?branch=master)](https://travis-ci.org/TotalVerb/AlgebraicTraits.jl)

[![Coverage Status](https://coveralls.io/repos/TotalVerb/AlgebraicTraits.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/TotalVerb/AlgebraicTraits.jl?branch=master)

[![codecov.io](http://codecov.io/github/TotalVerb/AlgebraicTraits.jl/coverage.svg?branch=master)](http://codecov.io/github/TotalVerb/AlgebraicTraits.jl?branch=master)

This package provides traits for algebraic structures on various operations.
Being able to dispatch implementations on traits is an extremely powerful
feature of Julia.

Here is a simple example. It is known that strings form a monoid under
concatenation, which in Julia uses the `*` symbol. We may describe this using
traits as such:

```julia
associativity(::Type{String}, ::typeof(*)) = Associative
closure(::Type{String}, ::typeof(*)) = Closed
identification(::Type{String}, ::typeof(*)) = Identified
```

From this, `AlgebraicTraits` can infer the monoid structure:

```julia
ismonoid(::Type{String}, ::typeof(*)) = true
```

This package takes an approach from the abstract algebra perspective instead of
the category theory perspective.
