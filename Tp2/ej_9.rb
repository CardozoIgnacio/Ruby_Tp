def long_4(palabra)
	if palabra.length>=4
		return true
	else
		return false
	end
end

def sin_espacios(palabra)
	i=0
	begin
		i=i+1
	end until(i==palabra.length||palabra[i]==" ")
	if(palabra[i]==" ")
		return false
	else
		return true
	end
end

def invertir(palabra)
	pal_inv=""
	i=palabra.length-1
	begin
		pal_inv=pal_inv+palabra[i]
		i=i-1

	end until(i==-1)
	return pal_inv
end

def palindromo(palabra)
	pali=invertir(palabra)
	if(pali==palabra)
		return true
	else
		return false
	end
end

def ingresar_palabra()
	puts "Ingrese un palabra"
	palabra=gets.chomp
	if(long_4(palabra))
		if(sin_espacios(palabra))
			return palabra
		else
			puts "La palabra no puede contener espacios"
			return ingresar_palabra()
		end
	else
		puts "Longitud de palabra no cumple los parametros"
		return ingresar_palabra()
	end
end
#main
puts "Consigna"
puts "- Cree un programa que permita ingresar una palabra de más de 4 letras sin espacios. Además debe
contener una función llamada “palíndromo?”. Un palíndromo es una palabra que se lee igual tanto desde izq. a
der. como de der. a izq. (también se las llaman capicúa, p.ej. “neuquen”). La función debe retornar true o false."
palabra=ingresar_palabra()
if(palindromo(palabra))
	puts "La palabra ingresada es palindromo"
else
	puts "La palabra ingresada no es palindromo"
end
final=gets.chomp