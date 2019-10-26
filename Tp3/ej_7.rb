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

def palabras_5car(oracion)
    i=0
    palabra=""
    begin
        if(oracion[i] != " " && oracion[i]!=".")
            palabra=palabra+oracion[i]
        else
            if (palabra.length<5)
                puts palabra
            end
            palabra=""
        end
        i=i+1
    end until (oracion.length==i)
end
#main
puts "Consigna"
puts "Realizar un programa donde el usuario ingrese una frase u oración,y retorne todas las palabras con menos de 5 caracteres"

cad=ingrese_cad()
palabras_5car(cad)


final=gets