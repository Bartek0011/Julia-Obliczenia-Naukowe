function p1(n::Int, r::Float32, p0::Float32)
	if (n == 0)
		p0
	else     
		p = p1(n-1,r,p0) 
	 	println(n, " ",	Float32(p+r*p*(1-p)))	
		Float32(p+r*p*(1-p))		
	end
end

function p2(n::Int, r::Float32, p0::Float32)
	if (n == 0)
		p0
	else     
		p = p2(n-1,r,p0) 
		temp = Float32(p+r*p*(1-p))
		if(n == 30)
			temp = Float32(0.722)
		end
	 	println(n, " ",	temp)	
		Float32(p+r*p*(1-p))		
	end
end

function pm(n::Int, r::Float64, p0::Float64)
	if (n == 0)
		p0
	else     
		p = pm(n-1,r,p0) 
	 	println(n," ",	Float64(p+r*p*(1-p)))
		Float64(p+r*p*(1-p))
	end
end
println("Float32")
println("\nA")
p1(40, Float32(3.0), Float32(0.01))
println("\nB")
p2(40, Float32(3.0), Float32(0.722))
println("\nFloat64")
pm(40, Float64(3.0), Float64(0.01))
