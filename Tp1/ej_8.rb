def primo(num,aux)
	if(aux==1)
		return true
	else
		if(num==aux)
			return primo(num,aux-1)
		else
			if num%aux==0
				return false
			else
				return primo(num,aux-1)
			end
		end
	end
end

def es_primo(num)
	return primo(num,num)
end

def ingreso_datos()
	return gets.chomp.to_i
end
#main
puts "Consigna"
puts "8. Diseñe un algoritmo modular (PROGRAMA) que permita ingresar valores y sumar aquellos que sean primos.
Considere que el ingreso finaliza a petición del usuario y que debe presentarse al finalizar la suma calculada y la
cantidad de valores sumados. Indique cómo se pasan los parámetros al subprograma. "
print "Ingrese un numero por favor"
num=ingreso_datos

if es_primo(num)
	print "Es primo"
else
	print "No es primo"
end


final=gets.chomp
