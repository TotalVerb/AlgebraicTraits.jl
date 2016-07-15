export ismonoid

ismonoid(T::Type, f::Function) =
    closure(T, f) === Closed &&
    identification(T, f) === Identified &&
    associativity(T, f) === Associative
