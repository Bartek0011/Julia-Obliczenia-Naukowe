aa(x) = x^2
bb(x) = (x^2)-2
cc(x) = sin(x)

function msiecznych(f::Function, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64,
maxit::Int)

f0 = f(x0)
f1 = f(x1)

	for i = 1 : maxit
		if abs(f0) > abs(f1)
			temp = x1
			x1 = x0
			x0 = temp
			temp = f1
			f1 = f0
			f0 = temp
		end
		s = (x1 - x0)/(f1 - f0)
		x1 = x0
		f1 = f0
		x0 = x0 - f0 * s
		f0 = f(x0)
		if abs(x1 - x0) < delta || abs(f0) < epsilon
			return x0, f0, i, 0
		end
	end
	return 0, 0, 0, 1
end

#println("f(x) = x^2\n")
#println("$(msiecznych(aa, -2.0, -1.0, 10.0^(-5), 10.0^(-5), 100))\n")
#println("f(x) = x^2 - 2\n")
#println("$(msiecznych(bb, -4.0, -3.0, 10.0^(-5), 10.0^(-5), 100))\n")
#println("f(x) = sin(x)\n")
#println("$(msiecznych(cc, -2.2, -2.0, 10.0^(-5), 10.0^(-5), 100))\n")

