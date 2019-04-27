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

def palabras_cant(oracion)
    palabra=""
    i=0
    cant=0
    begin
        if (oracion[i]!=" "&&oracion[i]!=".")
            cant=cant+1
        end
        i=i+1
    end until(i==oracion.length)
    return cant
end
#main
puts "Consigna"
puts "Realizar un programadonde el usuario ingrese una cadena de caracteres finalizada por un punto 
y el programa devuelva cuantos caracteres se ingresaron, sin tener en cuenta los espacios en blanco.
 (El punto es el carácter que indica el final de la cadena, no se debe contar, tampoco el ENTER, 
 si estuviera en la cadena.)"

 cade=ingreso_cad()
 print "La cantidad de caracteres ingresados son#{palabras_cant(cade)}"

final=gets