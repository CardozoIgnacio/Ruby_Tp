def parecido(pal,llaves)
        i=0
        begin
                pal_aux=pal
                aux=pal_aux.delete(llaves[i])
                i=i+1
        end until (i==llaves.size()|| aux.size()==0)
        if i==llaves.size()
                return 404
        else
                return llaves[i]
        end
end

def diccionario(pal)
    dicc=
    {
        "Sinonimo"=>"adjetivo/nombre masculino.[palabra, expresion] Que tiene el mismo significado que otra u otras palabras o expresiones.",
        "estado"=>"Situacion o modo de estar de una persona o cosa, en especial la situación temporal de las personas o cosas cuya condicion está sujeta a cambios",
        "energia"=>"Capacidad que tiene la materia de producir trabajo en forma de movimiento, luz, calor, etc."

     }
     definicion="No existe en el diccionario"
     if (dicc.has_key?(pal))
        definicion= dicc[pal]
     else
        aux=parecido(pal,dicc.keys())
        if( aux!= 404)
                definicion=dicc[aux]
        end

     end
     
     return definicion
     

end
puts"Cree un hash con palabras tomadas del diccionario (por lo menos 10),
 con su correspondiente significado. Cree una función para que cuando el 
 usuario ingrese una palabra a buscar, devuelva su significado, pero si no
 está, devuelva el significado de la palabra que más se parezca."

 puts "Ingrese una palabra a buscar en el diccionario"
 palabra=gets.chomp
 
 puts diccionario(palabra)