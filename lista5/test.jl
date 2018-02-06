# push!(LOAD_PATH, "/home/...")
using blocksys

Al = loadMatrix("A50000.txt")
A = Al[1]
l = Al[2]
b = loadVector("b50000.txt")
#x = loadVector("output8gec.txt")

# @time x = full(A)\b
# saveVector("output8.txt", x)

# A::SparseMatrixCSC, b::Vector{Float64}, n::Int64,eps::Float64

@time xge = gaussChoice(A, b, l, eps(Float64))
saveVector("output50000gec.txt", xge[1], xge[2])


# @time xge = gauss(A, b, l, eps(Float64))
# saveVector("output50000ge.txt", xge)

# b = obliczb(A, x)
# saveVector("b8a.txt", b[1], b[2])
x1 = loadVector("output50000gec.txt")
roz(x1)

