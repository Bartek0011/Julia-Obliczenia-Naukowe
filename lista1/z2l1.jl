
function fun(f)
	x = f(3(4/3-1)-1)
	#@printf("%f\n", x)
	#println(f, ": ", x)
	dump(x)
end

fun(Float16)
fun(Float32)
fun(Float64)

