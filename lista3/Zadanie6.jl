f(x) = e^(1-x)-1
pf(x) = -e^(1-x)
g(x) = x*e^(-x)
pg(x) = -e^(-x)*(x-1)
include("Zadanie1.jl")
include("Zadanie2.jl")
include("Zadanie3.jl")

println("f(x) = e^(1-x)-1\n")
println("bisekcji")
println("$(mbisekcji(f, 0.5, 1.5, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))\n")
println("Newtona")
println("$(mstycznych(f, pf, 1.0, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))\n")
println("siecznych")
println("$(msiecznych(f, 0.5, 1.5, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))\n")



println("\nf(x) = xe^(-x)\n")
println("bisekcji")
println("$(mbisekcji(g, -0.5, 0.5, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))\n")
println("Newtona")
println("$(mstycznych(g, pg, -0.25, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))\n")
println("siecznych")
println("$(msiecznych(g, -0.5, 0.5, 0.5*10.0^(-5), 0.5*10.0^(-5), 100))\n")

