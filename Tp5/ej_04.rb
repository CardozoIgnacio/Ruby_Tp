def invertir_array(arry)
    aux=Array.new()
    i=arry.size-1
    begin
        aux[aux.size]=arry[i]
        i=i-1
    end until(aux.size==arry.size)
    return aux
end

#main
colores = ["rojo","verde","azul","negro","celeste","blanco"]
colores_inv= invertir_array(colores)
puts colores
puts colores_inv