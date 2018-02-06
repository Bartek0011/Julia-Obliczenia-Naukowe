module z1i2i3i4
export ilorazyRoznicowe
export warNewton
export naturalna
export rysujNnfx

using Polynomials
using Winston

function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
	fx = Array(Float64, length(f)+1)
	for k = 1 : length(f)
		fx[k]=f[k]
	end
	for j = 1 : length(f)
		for i = (length(f)-1) : -1 : j
			fx[i+1]=(fx[i+1]-fx[i])/(x[i+1]-x[i-j+1])
		end
	end
	return fx
end

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
	nt=fx[length(fx)-1]
	for i= length(fx)-2:-1:1
		nt=nt*(t-x[i])+fx[i]
	end
	return nt
end

function naturalna(x::Vector{Float64}, fx::Vector{Float64})
	n = length(x)
	
	W = Poly([fx[1]])
	xx = Poly([1])
	
	for i = 1: n-1
		xx = xx*Poly([-x[i], 1])
		W = W + xx*fx[i+1]
		
	end
	return coeffs(W)
end

function rysujNnfx(f ,a::Float64,b::Float64,n::Int)
	h=Float64((b-a)/n)
	x = Array(Float64, n+1)
	fx = Array(Float64, n+1)
	for k = 0 : n
		x[k+1] = a+k*h
		fx[k+1] = f(x[k+1])
	end
	c = ilorazyRoznicowe(x,fx)
	

	m = n*15
	x2 = Array(Float64, m+1)
	fx2 = Array(Float64, m+1)
	wN = Array(Float64, m+1)
	h2 = (b-a)/m
	for i=0:m
		x2[i+1] = a+i*h2
		fx2[i+1] = f(x2[i+1])
	end
	for i=0:m
		wN[i+1]=warNewton(x,c,x2[i+1])
	end
	
	plot(x2,fx2,"b", x2,wN, "g^")
	savefig("_$n.png")
end


end
