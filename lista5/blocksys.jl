module blocksys

	export loadMatrix, loadVector, saveVector, gauss, gaussChoice, obliczb, roz


	function loadMatrix(matrix::AbstractString)
		open(matrix) do m
			line = split(readline(m))
			n = parse(Int64, line[1])
			l = parse(Int64, line[2])

			el = n*l+3*(n-l)
			# I, J, V do rzadkiej macierzy
			I = Array(Int64, el)
			J = Array(Int64, el)
			V = Array(Float64, el)
			
			i = 1
			while !eof(m) # eof- end of line
				line = split(readline(m))
				I[i] = parse(Int64, line[1])
				J[i] = parse(Int64, line[2])
				V[i] = parse(Float64, line[3])
				i += 1
			end

		return sparse(I, J, V), l
		end
	end

	function loadVector(table::AbstractString)
		open(table) do t
			b = Array(Float64, parse(Int64, readline(t)) )
			
			i=1
			while !eof(t)
				b[i] = parse(Float64, readline(t))
				i += 1
			end

		return b
		end
	end

	function saveVector(file::AbstractString, x::Array{Float64}, n::Int64)
		open(file, "w") do f
			println(f, n)
			for i in x
				println(f, i)
			end
		end
	end

function gauss(A::SparseMatrixCSC, b::Vector{Float64}, l::Int64, eps::Float64)
		n = length(b)
		x = Array(Float64, n)
		v = Int64(n/l)
  
		for k = 1 : n-1
			kmod = l - (k % l)
			element = A[k, k]
		
			if abs(element) < abs(eps)
				println("macierz osobliwa")
				return Array(Float64, 0)
			end
		
			if kmod <= 1 && k < n-l # użyte do wyznaczania ostatniej wartości niezerowej
				j = kmod + l
			else
				j = kmod
			end
			for i = k+1 : k+j
				m = Float64(0.0 - A[i, k]/element)  # obliczanie mnożnika
				# zerowane są po kolei kolumny (od góry w dół, póżniej w prawo i tak do końca) niezerowe pod przekątną w macierzy 
				A[i, k] = 0.0
				if k + l <= n
					for h = k+1 : k+l
						A[i, h] += A[k, h]*m
					end				
				else 
					for h = k+1 : n
						A[i, h] += A[k, h]*m
					end
				end
				# odpowiednie zmiany w wektorze b
				b[i] += b[k]*m
			end
		end
		# obliczanie wektora x, od dołu
		x[n] = b[n]/A[n, n]
	
		for w = 1 : l-1
			x[n-w] = b[n-w]
			for j = 1 : w
				x[n-w] -= (x[n-w+j]*A[n-w, n-w+j])
			end
			x[n-w] = x[n-w]/A[n-w, n-w]
		end
	
		for bl = 1 : v-1 
			for w = bl*l : ((bl*l)+(l-1))
				x[n-w] = b[n-w]
				for j = 1 : l 
					x[n-w] = x[n-w] - (x[n-w+j]*A[n-w, n-w+j])
				end
				x[n-w] = x[n-w]/A[n-w, n-w]
			end
		end

		return x, length(x)
	end

	function gaussChoice(A::SparseMatrixCSC, b::Vector{Float64}, l::Int64,eps::Float64)
		n = length(b)
		x = Array(Float64, n)
		v = Int64(n/l)
   
		for k = 1 : n-1
			kmod = l - (k % l)
			max = k

			if kmod <= 1 && k < n-l 
				j = kmod + l
			else
				j = kmod
			end
        
			for w = k+1 : k+j
				if abs(A[w, k]) > abs(A[max, k])
					max = w
				end 			
			end

			if max != k
				if k+(l*2)+1 <= n
					for i = 0 : (l*2)+1
						change = Float64(A[k, k+i])
						A[k, k+i] = A[max, k+i]
						A[max, k+i] = change   
					end
				else
					for i = 0 : n-k
						change = Float64(A[k, k+i])
						A[k, k+i] = A[max, k+i]
						A[max, k+i] = change   
					end
				end
			
				change = Float64(b[k])
				b[k] = b[max]
				b[max] = change
			end

			element = Float64(A[k, k])
			for i = k+1 : k+j
				m = Float64(0.0 - A[i, k]/element)
				A[i, k] = 0.0

				if k + 2 * l + 1<= n
					for h = k+1 : k+2*l-1
						A[i, h] += A[k, h]*m
					end
				else 
					for h = k+1 : n
						A[i, h] += A[k, h]*m
					end
				end

				b[i] += b[k]*m
			end
		end
 
		x[n] = b[n]/A[n, n]  
		for w = 1 : l-1
			x[n-w] = b[n-w]
			for j = 1 : w
				x[n-w] = x[n-w] - (x[n-w+j]*A[n-w, n-w+j])
			end
			x[n-w] = x[n-w]/A[n-w, n-w]
		end  

		for bl = 1 : v-1
			for w = (bl*l):((bl*l)+(l-1)) 
				x[n-w] = b[n-w]
				it = l + (w-(bl*l))
				for j = 1 : it 
					x[n-w] = x[n-w] - (x[n-w+j]*A[n-w, n-w+j])
				end
				x[n-w] = x[n-w]/A[n-w, n-w]
			end
		end

		return x, length(x)
	end

	function obliczb(A::SparseMatrixCSC, x::Vector{Float64})
			b = full(A)*x

			return b, length(b)
	end

	function roz(x1::Vector{Float64})
			# x2 = 1, 1 , 1 ... 1
			x2 = Array(Float64, length(x1))
			# x2 = 1.0
			for i = 1 : length(x1)
				x2[i] = 1.0
			end
			
	
			r = norm(x2-x1) / norm(x1)
			println(r)
			return r
	end


end # blocksys
