f(x) = 3x - e^x
include("Zadanie1.jl")
println("\nPierwsze miejsce przecięcia")
println(mbisekcji(f, 0.0, 1.0, 10.0^(-4), 10.0^(-4), 100))
println("\nDrugie miejsce przecięcia")
println(mbisekcji(f, 1.0, 2.0, 10.0^(-4), 10.0^(-4), 100))

