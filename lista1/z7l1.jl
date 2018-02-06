function ret(b)
	print("pochodna ")
	print(f1(1.0), "\n")
	
	x0=1.0
	p=f1(1.0)
	for i = 0:54
		print(i, ": ")
		print(f2(x0, (2.0^-i)+b))
		pw=f2(x0, 2.0^-i+b)
		err=Float64(p-pw)
		if(p<pw)
			err=pw-p
		end
		print(" blad ",err, "\n")
	end
end

function f(x)
	return Float64(sin(x)+cos(3*x))
end

function f1(x)
	return cos(x)-3*sin(3*x)
end

function f2(x,h)
	return Float64((f(x+h)-f(x))/h)
end

ret(0.0)
println("\n")
ret(1.0)

