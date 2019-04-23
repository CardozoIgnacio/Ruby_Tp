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
	puts "Ingrese un numero por favor:"
	return gets.chomp.to_i
end
def desea_cont()
	puts "Desea termina el ingreso de numeros.Ingrese si o no(s/n)" 
	cont=gets.chomp
	if(cont!="si" && cont!="no"&&cont!="s"&&cont!="n")
		puts "Por favor ingrese si o no"
		return desea_cont
	else
		if(cont=="si"||cont=="s")
			return true
		else
			return false
		end
	end
end
#main
puts "Consigna"
puts "8. Diseñe un algoritmo modular (PROGRAMA) que permita ingresar valores y sumar aquellos que sean primos.
Considere que el ingreso finaliza a petición del usuario y que debe presentarse al finalizar la suma calculada y la
cantidad de valores sumados. Indique cómo se pasan los parámetros al subprograma. "


sum=0

begin
num=ingreso_datos
if es_primo(num)
	sum=sum+num
else
	print "No es primo"
end
cont=desea_cont()
end until(cont== false)

print "La sumas  de los numeros primos es #{sum}"
final=gets.chomp
