def ingreso_cad_l8()
	puts "Ingrese una cadena de longitud no menor a 8"
	cad_aux=gets.chomp
	if(cad_aux.length<8)
		puts "Cadena ingresada no cumple los parametros establecidos"
		return ingreso_cad_l8()
	else
		return cad_aux
	end
end
def ingresar_elem_cad(elem,pos,cad)
	i=0
	cad_aux=""
	
		begin
			if(i==pos)
				cad_aux=cad_aux+cad[i]+elem
			else
				cad_aux=cad_aux+cad[i] 
			end
			i=i+1

		end until(i==cad.length)

	return cad_aux


end
def random_char()
	return rand(97..122).chr
end
def codif_cad(cadena)
	rand_char=""
	i=cadena.length
	cad_aux=cadena
	begin
		rand_char=random_char()
		cad_aux=ingresar_elem_cad(rand_char,i,cad_aux)
		i=i-1
	end until(i==-1)
	return cad_aux
end
#main
puts "Consigna:"
puts "- Diseñe un programa que permita ingresar una cadena de no menos de 8 caracteres. Como salida
transforme la cadena original agregando letras del alfabeto al azar entre las letras originales de la cadena.
P/ej. REDOBLANTE => RAEBDCODBELFAGNHTIEJ
"
cad= ingreso_cad_l8
cad_aux=codif_cad(cad)

print cad_aux
final=gets.chomp