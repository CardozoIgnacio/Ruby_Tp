def par(num)
	 if num%2==0
		return true
	else
		return false
	end
end


def ingreso_datos()
	puts "Ingrese un numero:"
	num=gets.chomp.to_i
	if(num==0)
		puts "Numero no puede ser 0."
		return ingreso_datos()
	else
		return num
	end		
end

#main
puts"Consigna"
puts " Diseñe un algoritmo modular (PROGRAMA) que determine si un valor ingresado por el usuario es par o impar. Si
el valor ingresado es cero, debe volver a solicitar su ingreso. Considere que los valores se introducen en el
programa principal. Indique cómo se pasan los parámetros al subprograma. "
num=ingreso_datos
if(par(num))
	puts "Numero ingresado es par"
else
	puts "Numero ingresdo no es par"
end


final=gets.chomp