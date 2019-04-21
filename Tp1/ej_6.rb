def piramide(car,pisos)
	fila=1	
	begin
		colum=0
		begin
			print car
			colum=colum+1
		end until(fila==colum)
		puts " "
		fila=fila+1
	end until(fila==pisos+1)
		
	
		
end
def ingreso_caracter()
	return gets.chomp.to_s
end
def ingreso_num()
	return gets.chomp.to_i
end 

#main
puts "Consigna:"
puts " Diseñe un algoritmo modular (PROGRAMA) al cual se le ingrese por teclado un caracter y un número, a partir de
ese caracter y ese número cree una triangulo de caracteres.
"
print"Ingrese un caracter: "
car=ingreso_caracter
print "Ingrese cantidad de pisos de la piramide"
pisos=ingreso_num
piramide(car,pisos)

final=gets.chomp.to_i