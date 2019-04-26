def ingreso_numeroReal()
    puts "Ingrese un numero real"
    num=gets.chomp.to_f
    return num
end

def conv_string(num)
    cad="#{num}"
    return cad
end

def parte_entera(num)
    entero=""
    i=0
    begin
       entero= entero+num[i]
        i=i+1
    end until(num[i]==".")
    return entero
end

#main
puts "Consigna"
puts "Escriba un programa que permita ingresar un númeroreal.
Deberá convertirlo a string con el formato nnnnnnn.nn respetando 
7 lugares para la parte entera y 2 para la parte decimal. 
Se completa con ceros a la izquierda de ser necesario."

num=ingreso_numeroReal()
cad_num=conv_string(num)
puts parte_entera(cad_num)

final=gets.chomp