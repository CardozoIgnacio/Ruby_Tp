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
def ingreso_datos()
	return gets.chomp.to_i
end
def imprimir_primos(num)
	if(num>0)
		if(primo(num,num))
			print "#{num}-"
		end
		imprimir_primos(num-1)
	else
		return
	end
end

#main
puts "Consigna"
puts " Diseñe un algoritmo modular (PROGRAMA) en el que se pueda ingresar un número X y el programa muestre
todos los números primos positivos anteriores a X"
print"Ingrese un numero"
num=ingreso_datos
imprimir_primos(num)

final=gets.chomp