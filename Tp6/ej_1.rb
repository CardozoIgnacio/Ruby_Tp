puts "Genere un hash para asignar los resultados de y = x2+1
para valores de x desde -10 a 10 con intervalos de 1 en 1."

x=-10
h=Hash.new()
h.each

begin
 h[x]=2*x+1
 x=x+1
end until(x==11)

puts h