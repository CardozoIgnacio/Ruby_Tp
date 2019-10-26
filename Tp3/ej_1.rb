def ingrese_letra()
	letra=gets.chomp
	if letra.length>1
		puts "Por favor ingrese una letra."
		return ingrese_letra
	else
		return letra
	end
end
def ingrese_palabra()
	palabra=gets.chomp
	if palabra.length==1
		puts "Por favor ingrese una palabra."
		return ingrese_palabra
	else
		
		return palabra
	end
end

def eliminar(palabra,letra)
	palabra_aux=""
	i=0
	begin
		if(palabra[i]!=letra)
			palabra_aux=palabra_aux+palabra[i]
		end
		i=i+1		
	end until(i==palabra.length)
	return palabra_aux
end

#main
puts "Consigna"
puts "Realizar un programa donde el usuario ingrese un string y una letra y retorne un string que no contenga la letra
ingresada"
puts "Ingrese una palabra"
palabra=ingrese_palabra
puts "Ingrese una letra"
letra=ingrese_letra()

nueva=eliminar(palabra,letra)
print nueva


final= gets.chomp