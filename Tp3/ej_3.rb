def ingresar_cad_20()
	puts "Ingrese una cadena de mas de 20 caracteres:"
	cad=gets.chomp
	if(cad.length>20)
		return cad
	else
		return ingresar_cad_20
	end
end

def vocal(cadena,vocalMIN,vocalMAY)
	i=0
	cant=0
	begin
		if(cadena[i]==vocalMIN||cadena[i]==vocalMAY)
			cant=cant+1
		end
		i=i+1
	end until(cadena.length==i)
	return cant
end

def cantidad_vocales(cadena)
	print "La cantidad de vocales a: "
	puts vocal(cadena,"a","A")
	print "La cantidad de vocales e: "
	puts vocal(cadena,"e","E")
	print "La cantidad de vocales i: "
	puts vocal(cadena,"i","I")
	print "La cantidad de vocales o: "
	puts vocal(cadena,"o","O")
	print "La cantidad de vocales u: "
	puts vocal(cadena,"u","U")
end

#main
puts "Consigna"
puts "Escriba un programa que permita ingresar una cadena de más de 20 caracteres e informe cuantas vocales (de
cada una) hay en la cadena ingresada"
cad=ingresar_cad_20
cant=cantidad_vocales(cad)

final=gets.chomp