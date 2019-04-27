def ingreso_numeroReal()
    puts "Ingrese un numero real"
    num=gets.chomp.to_f
    return num
end

def conv_string(num)
    cad="#{num}"
    return cad
end

def parte_entera_dec(num)
    entero=""
    decimal =""
    i=0
    begin
       entero= entero+num[i]
        i=i+1
    end until(num[i]==".")
    i=i+1
    begin
        decimal=decimal+num[i]
        i=i+1
    end until (i==num.length)
    return entero,decimal
end

def completar_ceros_entero(entero)
    num=entero
    if num.length==7
        return num
    else
        return completar_ceros_entero("0"+num)
    end
end

def completar_ceros_dec(decimal)
    cad_dec=""
    i=0
    begin
        cad_dec=cad_dec+decimal[i]
        i=i+1
    end until i==decimal.length||i==2
    if(cad_dec.length==1)
        return cad_dec+"0"
    else
        return cad_dec
    end
end

def formato(entero,decimal)
    
    cadena_f=completar_ceros_entero(entero)+"."+completar_ceros_dec(decimal)       
    return cadena_f
end
#main
puts "Consigna"
puts "Escriba un programa que permita ingresar un númeroreal.
Deberá convertirlo a string con el formato nnnnnnn.nn respetando 
7 lugares para la parte entera y 2 para la parte decimal. 
Se completa con ceros a la izquierda de ser necesario."
begin
    num=ingreso_numeroReal()
    cad_num=conv_string(num)
    entero,decimal= parte_entera_dec(cad_num)
    if (entero.length>7)
        puts "Parte entera excede la capacidad de representacion.Ingrese nuevamente"
    end
end while (entero.length>7)

puts formato(entero,decimal)


final=gets.chomp