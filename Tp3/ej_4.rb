def ingrese_cad()
	puts "Ingrese una cadena finalizada en un punto"
	cad=gets.chomp
	if cad[cad.length-1]=="."
		return cad
	else
		puts "La cadena ingresada debe terminar en un punto."
		return ingrese_cad()		
	end
end
 
def cantindad_palabras(cadena)
	cant_pal=0
	i=cadena.length-2
	begin
		if(cadena[i]==" ")
			cant_pal=cant_pal+1
		end
		i=i-1
	end until(i==-1)
	return cant_pal
end
#main

cad=ingrese_cad
cant_pal=cantindad_palabras(cad)

print "La cadena ingresada tiene #{cant_pal} palabras"

final=gets.chomp