aa(x) = x^2
aaa(x) = 2x
bb(x) = (x^2)-2
cc(x) = sin(x)
ccc(x) = cos(x)

function mstycznych(f::Function, pf::Function, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
	v = f(x0)
	if abs(v) < epsilon
		return x0, v, 0, 0
	end
	
	for i = 1 : maxit
		if pf(x0) < 0-epsilon && pf(x0) > 0+epsilon
			return 0, 0, 0, 2
		end
		x1 = x0 - v/pf(x0)
		v = f(x1)
		if abs(x1 - x0) < delta || abs(v) < epsilon
			return x1, v, i, 0
		end
		x0 = x1
	end
	return 0, 0, 0, 1
end

#println("f(x) = x^2\n")
#println("$(mstycznych(aa, aaa, 1.0, 10.0^(-5), 10.0^(-5), 100))\n")
#println("f(x) = x^2 -2\n")
#println("$(mstycznych(bb, aaa, -2.0, 10.0^(-5), 10.0^(-5), 100))\n")
#println("f(x) = sin(x)\n")
#println("$(mstycznych(cc, ccc, -4.0, 10.0^(-5), 10.0^(-5), 100))\n")

