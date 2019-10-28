puts "Implemente un programa que trabaje con 5 pilas (a,b,c,d,e).
 Genere un número al azar N y complete la pila a con N elementos. 
 Una vez generada empiece a pasar elementos a las pilas siguientes 
 teniendo en cuenta que solo puede hacerlo cuando la pila contenga
 más de un elemento. Cuando ninguna pila tenga elementos para pasarle 
 a la siguiente, el programa debe finalizar."


 
class Lista
    def initialize()
        @arry=Array.new()
    end

    def remove(pos)
        if pos<@arry.size()
            @arry[pos]=nil
            @arry=@arry.compact()
        else
            puts "Posicion #{pos} no es una posicion valida para eliminar"
        end
    end
    

    def size()
        return @arry.size()
    end
    
    def print()
        @arry.each do |a|
            puts a
        end
    end



    protected
    def add(elem)
        @arry.push(elem)
    end


    def first()
        return @arry[0]
    end

    def last()
        return @arry.last()
    end
end
 class Pila < Lista
    def initialize()
        super()
    end

    def apilar(elem)
        add(elem)
    end

    def desapilar()
        if size()>0
            aux=last()
            remove(@arry.size-1)
            return aux
        else
            puts "No hay elementos para desapilar"
        end
    end
end

pilaA=Pila.new()
pilaB=Pila.new()
pilaC=Pila.new()
pilaD=Pila.new()
pilaE=Pila.new()

numero =rand(1..50)

for i in 1..numero
    pilaA.apilar(rand(1..80))
end

for i  in 1..numero
    aux=pilaA.desapilar()
    pilaB.apilar(aux)
end

for i  in 1..numero
    aux=pilaB.desapilar()
    pilaC.apilar(aux)
end

for i  in 1..numero
    aux=pilaC.desapilar()
    pilaD.apilar(aux)
end

for i  in 1..numero
    aux=pilaD.desapilar()
    pilaE.apilar(aux)
end

puts "pila contiene:"
 pilaA.print()
puts "pila contiene:"
 pilaB.print()
 puts "pila contiene:"
 pilaC.print()
 puts "pila contiene:"
 pilaD.print()
 puts "pila contiene:"
 pilaE.print()