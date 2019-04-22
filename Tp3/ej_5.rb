def ingrese_cadena()
    cadena=gets.chomp
    if(cadena=="")
        puts "La cadena debe poseer al menos una letra"
        return ingrese_cadena
    else
        return cadena
    end

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






final=gets.chomp