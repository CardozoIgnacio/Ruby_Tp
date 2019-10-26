def ingrsear_datos()
	print "Ingrese numero: "
	return gets.chomp.to_i
end
def multiplicar(mult1,mult2)
	mult=0
	while(mult2!=0)
		mult=mult+mult1
		mult2=mult2-1
	end
	return mult
end

#main
puts "Consigna:"
puts " Diseñe un algoritmo modular (PROGRAMA) que calcule el producto (mediante sumas sucesivas) de 2 números
ingresados por el usuario. Considere que los valores a multiplicar se introducen en el programa principal.
"
mult1=ingrsear_datos()
mult2=ingrsear_datos()
mult=multiplicar(mult1,mult2)
print "El resultado de multiplicar #{mult1} por #{mult2}: #{mult}"

final=gets.chomp