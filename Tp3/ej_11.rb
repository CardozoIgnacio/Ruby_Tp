#modulos
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

def comer_espacios(cadena)
    i=0
    cad_sin_espacios=""
    palabra_aux=""
    begin
            if(cadena[i]!=" "&&cadena[i]!=".")
                palabra_aux=palabra_aux+cadena[i]
            else
                if (palabra_aux!="")
                    cad_sin_espacios=cad_sin_espacios+palabra_aux+" "
                    palabra_aux=""
                end                            
            end

        i=i+1
    end until(i==cadena.length)
    cad_sin_espacios[cad_sin_espacios.length-1]="."
    return cad_sin_espacios
end
#main
puts "Consigna"
puts "Realizar un programa donde el usuario ingrese una cadena de caracteres finalizada en un punto,
 dicha cadena puede empezar con uno o más espacios en blanco y entre cada palabra pueden venir más de un espacio en blanco,
 el programa debe retornar la cadena pero sin espacios en blanco delante y con un solo espacio entre cada palabra, tampoco 
puede quedar ningún espacio en blanco al final de la cadena, es decir, inmediatamente después del ultimo carácter debería estar el punto."

cadena=ingreso_cad()
cadena_completa=comer_espacios(cadena)
puts cadena_completa

final=gets.chomp