
function fun()
	x = Float64(1)

	while x < Float64(2) && Float64(1/x)*x == 1
		x=nextfloat(x)
	end

	println(x)
end

fun()

