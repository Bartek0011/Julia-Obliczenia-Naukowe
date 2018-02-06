function f1(n::Int, c::Float64, xzero::Float64)
	if (n == 0)
		xzero
	else     
		x = (f1(n-1, c, xzero))^2 + c;		
	 	println(n, " ",	x)	
		x
	end
end
println("\n1.")
f1(40, -2.0, 1.0)
println("\n2.")
f1(40, -2.0, 2.0)
println("\n3.")
f1(40, -2.0, 1.99999999999999)
println("\n4.")
f1(40, -1.0, 1.0)
println("\n5.")
f1(40, -1.0, -1.0)
println("\n6.")
f1(40, -1.0, 0.75)
println("\n7.")
f1(40, -1.0, 0.25)

