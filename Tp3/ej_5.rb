def ingrese_cadena()
    cadena=gets.chomp
    if(cadena=="")
        puts "La cadena debe poseer al menos una letra"
        return ingrese_cadena()
    else
        return cadena
    end
end

def abre_nombre(cadena)
    first_name=" "
    i=0
    begin
        first_name=first_name+cadena[i]
        i=i+1
    end until(cadena[i]==" "||i==cadena.length)
    first_name=first_name+cadena[i]+cadena[i+1]+"."
    return first_name
    
end
#main
puts "Consigna"
puts "Escribir un programa que permita escribir sus 2 (dos) nombres en una cadena  y su apellido (1) en la otra. Deberá realizar una 
concatenación de nombres y apellido si todos juntos no superan 30 caracteres;de lo contrario deberá abreviar el segundo nombre poniendo
 la primera letra del mismo seguido de un punto."

puts "Ingrese sus nombres, separados x un espacio"
nombre=ingrese_cadena()

puts "Ingrese su apellido"
apellido=ingrese_cadena()
nombre_completo=""
if(nombre.length+apellido.length)>=10
    nombre=abre_nombre(nombre)   
end
nombre_completo=nombre+" "+apellido

puts "El nombre es "+nombre_completo




final=gets.chomp