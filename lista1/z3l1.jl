
function fun()
	x = Float64(1)
	
	println("[1; ")
	for i = 0:4
		println(bits(x))
		x = nextfloat(x)
		#x = x + Float64(2.0^(-52))
	end
	
	
end

function fun1()
	y = Float64(0.5)
	
	println("[0.5; ")
	for i = 0:4
		println(bits(y))
		y = nextfloat(y)
		#y = y + Float64(2.0^(-52))
	end
	
	
end

function fun2()
	z = Float64(2)
	
	println("[2.0; ")
	for i = 0:4
		println(bits(z))
		z = nextfloat(z)
	end
	
	#= nextfloat =#
end

fun()
println()
fun1()
println()
fun2()

