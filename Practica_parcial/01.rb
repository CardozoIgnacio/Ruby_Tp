def control(cadena)
    return no_contiene_num(cadena)
end
def comineza_letra(cadena)
    letra=cadena[0]
    if (letra>="A"&&letra<="Z")||(letra>="a"&&letra<="z")
        return true
    else
        return false
    end
end
def no_contiene_num(cadena)
    i=0
    numero=false
    begin
        if(cadena[i]>="0"&&cadena[0]<="9")
            numero=true
        end
        i=i+1
    end until(numero||i==cadena.length)
    if numero 
        return false
    else
        return true
    end
end
for i in (0..10)
    puts rand(10)
end

final=gets.chomp