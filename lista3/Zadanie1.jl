aa(x) = x^2
bb(x) = (x^2)-2
cc(x) = sin(x)

function sgn(x)
	if x == 0
		return 0
	end
	if x > 0
		return 1
	else
		return -1
	end
end

function mbisekcji(f::Function, a::Float64, b::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	u = f(a)
	v = f(b)
	e = b - a
	if sgn(u) == sgn(v)
		return 0, 0, 0, 1
	end
	
	for i = 1 : maxit
		e = e/2
		c = a + e
		w = f(c)
		if abs(e) < delta || abs(w) < epsilon
			return c, w, i, 0
		end
		if sgn(w) != sgn(u)
			b = c
			v = w
		else
			a = c
			u = w
		end	
	end	
end

#println("f(x) = x^2\n")
#println("$(mbisekcji(aa, -1.0, 1.0, 10.0^(-5), 10.0^(-5), 100))\n")
#println("f(x) = x^2 - 2\n")
#println("$(mbisekcji(bb, -2.0, 0.0, 10.0^(-5), 10.0^(-5), 100))\n")
#println("f(x) = sin(x)\n")
#println("$(mbisekcji(cc, -4.0, -2.0, 10.0^(-5), 10.0^(-5), 100))\n")
