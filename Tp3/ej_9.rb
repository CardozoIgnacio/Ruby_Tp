def ingreso_cad()
    puts "Ingrese una cadena de caracteres esta debera terminar en un punto "
    cad=gets.chomp
    if (cad[cad.length-1]==".")
        return cad
    else
        puts "La cadena ingresada no cumple los parametros establecidos"
        return ingreso_cad()
    end
end

def solo_4(oracion)
    palabra=""
    i=0
    begin
        if (oracion[i]!=" "&&oracion[i]!=".")
            palabra=palabra+oracion[i]
        else
            if(palabra.length==4)
                puts palabra
            end
            palabra=""
        end
        i=i+1
    end until(i==oracion.length)
end
#main
puts "Consigna"
puts "Realizar un programa donde el usuario ingrese una cadena de caracteres 
finalizada en un punto, y el programa retorne la cantidad de palabras con 4 y solo 4 caracteres."

cadena=ingreso_cad()
solo_4(cadena)

final=gets