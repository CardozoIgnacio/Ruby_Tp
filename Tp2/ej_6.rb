def ingresar_may_5()
	puts "Ingrese una cadena de caracteres de longitud mayor a 5:"
	cadena=gets.chomp
	if(cadena.length>5)
		return cadena
	else
		puts "Cadena no cumple parametros establecidos."
		return ingresar_may_5()
	end
end

def ing_iguales(cadena)
	puts "Ingrese una cadena:"
	cadena2=gets.chomp
	if(cadena.length==cadena2.length)
		return cadena2
	else
		puts "Cadena ingresada incorrecta, vulva a ingresar cadena"
		return ing_iguales(cadena)
	end
end

def es_vocal(caracter)
	if (caracter=="a"||caracter=="e"||caracter=="i"||caracter=="o"||caracter=="u"||caracter=="A"||caracter=="E"||caracter=="I"||caracter=="O"||caracter=="U")
		return true;
	else
		return false;
	end
end

def intercalar_cadena(cad1,cad2)

	cad_i=""
	for i in 0 .. (cad1.length-1)
		cad_i=cad_i+cad1[i]+cad2[i]
	end
	return cad_i
end

def unir(cad1,cad2)
	cad_c=cad1+cad2
	return cad_c
end

def cantidad_v(cadena)
	cant=0
	for i in 0 .. (cadena.length-1)
		if(es_vocal(cadena[i]))
			cant=cant+1
		end
	end
	return cant
end



#main
puts "Consigna:"
puts "- Ingresar dos cadenas de igual tamaño, mayores a 5 caract. Volver a solicitar su ingreso si las cadenas no
tienen igual tamaño. Luego, si la primera cadena tiene más vocales que la segunda, unir ambas cadena en
una nueva cadena, caso contrario generar una nueva cadena intercalando cada letra de la primer cadena con
cada letra de la segunda cadena y así sucesivamente.
"
cade1=ingresar_may_5
puts "Ingrese otra cadena con longitud igual a la anterior"
cade2=ing_iguales(cade1)
new_cad=""
if(cantidad_v(cade1)>cantidad_v(cade2))
	new_cad=unir(cade1,cade2)
else
	new_cad=intercalar_cadena(cade1,cade2)
end
print new_cad


final=gets.chomp