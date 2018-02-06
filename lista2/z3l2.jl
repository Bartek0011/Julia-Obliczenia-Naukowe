include("matcond.jl")
include("hilb.jl")

println("Hilberta")	
for i = 1:15
	A = hilb(i)
	x = ones(Float64, i)
	b = A*x
	x1 = A\b
	x2 = inv(A)*b
	println("$i $(rank(A)) $(cond(A)) $(abs(norm(x)-norm(x1))) $(abs(norm(x)-norm(x2)))")
end

println("\nlosowa")	

for  n in [5,10,20]
	for  c in [1,10.0,10.0^3,10.0^7,10.0^12,10.0^16]
		A = matcond(n, c)
		x = ones(Float64, n)
		b = A*x
		x1 = A\b
		x2 = inv(A)*b
		println("$n $(rank(A)) $(abs(norm(x)-norm(x1))) $(abs(norm(x)-norm(x2)))")
	end
end

