# push!(LOAD_PATH, "/home/...")
using z1i2i3i4

x = Array(Float64, 4)
f = Array(Float64, 4)
x=[-2.0, -1.0, 0.0, 1.0, 2.0]
y=[3.0, 0.0, -1.0, 0.0, 3.0]

fx=[3.0,-3.0,1.0,0.0,0.0]

#for t in (-2.0,-1.0,0.0,1.0,2.0)

#for t in (-2.0)
#	w = warNewton(x, fx, t)
#	#println(w)
#end

w = ilorazyRoznicowe(x,y)
println(w)
