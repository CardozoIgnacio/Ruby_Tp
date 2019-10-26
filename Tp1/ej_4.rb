def potencias(x,y)
	r=1
	while (y!=0)
		r=r*x
		y=y-1
	end
	return r
end

def ingreso_datos
	return gets.chomp.to_i
end

#main

puts "Consigna"
puts "Diseñe un algoritmo modular (PROGRAMA) que calcule la potencia de un número X elevado al exponente Y,
mediante productos sucesivos. Considere que la potencia mediante productos sucesivos se implementa con
estructuras MIENTRAS (while). Indique cómo se pasan los parámetros al subprograma. "
puts "Ingrese Base:"
base=ingreso_datos
puts "Ingrese Exponente:"
exp=ingreso_datos

resul=potencias(base,exp)

puts "El resultado es #{resul}"

final=gets.chomp