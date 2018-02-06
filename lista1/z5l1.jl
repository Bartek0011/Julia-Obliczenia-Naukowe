function f1()
	x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

	a = Float32(0.0)
	b = Float64(0.0)

	for i = 1:5
		a=a+(Float32(x[i])*Float32(y[i]))
		b=b+(Float64(x[i])*Float64(y[i]))
	end
	println("Float32: ",a)
	println("Float64: ",b)
	println()
end

function f2()
	x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	
	a = Float32(0.0)
	b = Float64(0.0)

	for i in [5, 4, 3, 2, 1]
		a=a+(Float32(x[i])*Float32(y[i]))
		b=b+(Float64(x[i])*Float64(y[i]))
	end
	println(typeof(a) ,"Float32 ",a)
	println(typeof(a) ,"Float64 ",b)
	println()
end

function f3()
	x = [2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
	y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
	z = Array{Float32}(5)
	v = Array{Float64}(5)
	aa = Float32(0.0)
	ab = Float32(0.0)
	ba = Float64(0.0)
	bb = Float64(0.0)
	a=Float32(0.0)
	b=Float64(0.0)
	
	for i in [5, 4, 3, 2, 1]
		z[i]=Float32(x[i])*Float32(y[i])
		v[i]=Float64(x[i])*Float64(y[i])
	end
	
	x=sort(z)
	y=sort(v)
	
	for i in [5, 4, 3, 2, 1]
		if x[i]<0.0
			aa=aa+x[i]
			ba=ba+y[i]
		else
			ab=ab+x[i]
			bb=bb+y[i]
		end
	end
	a=Float32(aa)+Float32(ab)
	b=Float64(ba)+Float64(bb)
	println(typeof(aa) ,"Float32 ",a)
	println(typeof(bb) ,"Float64 ",b)
end

f1()
f2()
f3()

