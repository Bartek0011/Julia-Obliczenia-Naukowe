function f(x)
	ret = (sqrt(x^2+1)-1)
	println(ret)
end

function g(x)
	ret = x^2/(sqrt(x^2+1)+1)
	println(ret)
end

function f1()
	x=-1.0
	while x>-11.0
		f(Float64(8^x))
		x=x-1.0
	end
end

function f2()
	x=-1.0
	while x>-11.0
		g(Float64(8^x))
		x=x-1.0
	end
end
	
println("pierwsz")
f1()
println("\ndruga")
f2()

