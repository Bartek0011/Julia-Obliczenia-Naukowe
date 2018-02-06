# push!(LOAD_PATH, "/home/...")
using z1i2i3i4

x = Array(Float64, 3)
fx = Array(Float64, 3)
x=[-1.0, 0.0, 1.0, 2.0]
y=[-1.0,0.0,-1.0,2.0]

#fx=[-1.0,0.0,-1.0,2.0]

fx=ilorazyRoznicowe(x,y)

ret = naturalna(x, fx)
println(ret)
