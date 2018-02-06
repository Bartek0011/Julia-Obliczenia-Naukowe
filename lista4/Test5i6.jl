# push!(LOAD_PATH, "/home/...")
using z1i2i3i4

#test zadania 4
for n in [5, 10, 15]
  #rysujNnfx(x->(x^2)-1, -5.0, 5.0, n)
end

#test zadania 5
for n in [5, 10, 15]
  rysujNnfx(x->exp(x), 0.0, 1.0, n)
  #rysujNnfx(x->(x^2)*sin(x), -1.0, 1.0, n)
end

#test zadania 6
for n in [5, 10, 15]
  #rysujNnfx(x->abs(x), -1.0, 1.0, n)
  #rysujNnfx(x->1/(1+(x^2)), -5.0, 5.0, n)
end

#rysujNnfx(x->(x^2)-1, -2.0, 2.0, 4)

