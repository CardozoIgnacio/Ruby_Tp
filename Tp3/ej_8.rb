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

def cant_palabras_B(oracion)
    i=0
    palabra=""
    cant=0
    begin
        if(oracion[i] != " " && oracion[i]!=".")
            palabra=palabra+oracion[i]
        else
            if (palabra[0]=="b"||palabra[0]=="B")
                cant=cant+1
            end
            palabra=""
        end
        i=i+1
    end until (oracion.length==i)
    return cant
end



#main
puts "Consigna"
puts "Realizar un programa donde el usuario ingrese una cadena de caracteres 
y el programa retorne la cantidad de palabras que comienzan con la letra “b”."

oracion=ingrese_cad()
num =cant_palabras_B(oracion)
puts "La cantidad de palabras que tiene la letra B son #{num}"

fnal=gets