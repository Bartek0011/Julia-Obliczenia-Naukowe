
function fun(f)
	x = f(1)
	epsilon = f(1)
	while f(x+epsilon/2)>x
		epsilon=f(epsilon/2)
	end

	println(f, "\nmacheps ",epsilon)
	println("eps() " ,eps(f))
	println()
end


function eta(f)
	eta = f(1)
	while f(eta/2)>0
		eta=f(eta/2)
	end
	println(f, " eta ",eta)
	println("nextfloat " , nextfloat(f(0.0)))
	println()
end

function mx(f)
	x=f(1)
	while !isinf(f(x*f(2.0)))
		x=x*f(2.0)
	end
	y=f(x)
	while(y+x>x)
		while !isinf(f(x+y))
			x=f(x+y)
		end
		y=y/f(2.0)
	end
	println(f," max: ",x)
	println("realMax: ",realmax(f))
	println()
end

# fun(Float16)
# fun(Float32)
# fun(Float64)

eta(Float64)

# mx(Float16)
# mx(Float32)
# mx(Float64)

