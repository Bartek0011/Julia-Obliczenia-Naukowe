f(x) = sin(x) - (0.5*x)^2
pf(x) = cos(x) - 0.5x
#metoda bisekcji
println("Metoda bisekcji")
include("Zadanie1.jl")
println(mbisekcji(f, 1.5, 2.0, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))

#metoda Newtona
println("Metoda Newtona")
include("Zadanie2.jl")
println(mstycznych(f, pf, 1.5, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))

#metoda siecznych
println("Metoda siecznych")
include("Zadanie3.jl")
println(msiecznych(f, 1.0, 2.0, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))

