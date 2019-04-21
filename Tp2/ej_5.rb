def cadena_car_6()
	puts "Ingrese una cadena de caracteres mayor que 6:"
	cadena=gets.chomp
	
	if(cadena.length>=6)
		return cadena
	else
		puts "Cadena ingresada no cumple los parametros."
		return cadena_car_6()
	end
 
end

def cara_b()
	puts "Ingrese un caracter a buscar en la cadena"
	return gets.chomp
end

def	busqueda_c(cadena,elem)
	i=cadena.length
	begin
		i=i-1
	end until(i==-1 ||cadena[i]==elem)
	if(i==-1)
		return 0
	else
		return i+1
	end
	
end


#main
puts "Consigna"
puts "Escriba una función llamada “existe_caracter” que realice la búsqueda de un carácter en una cadena
previamente ingresada. La cadena ingresada deberá tener más de 6 caract. Deberá retornar su posición si
existe (o cero si no existe)."
cad=cadena_car_6()
carc=cara_b()

num=busqueda_c(cad,carc)

if num==0
	puts "No se encontro el elemento"
else
	puts "El elemento se encontro en la posicion #{num}"
end


final=gets.chomp