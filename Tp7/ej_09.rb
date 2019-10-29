puts "A cada persona de una lista de personas (puede usar el Array de ejercicios anteriores) 
se les otorga un numero al azar desde 1 en adelante. Este númeroindicará el orden de acceso a 
una Cola de espera. Cuando las personas son encoladas, es momento de dar servicio a cada una. 
Esto significa que sale de esa estructura pero ingresa al azar a una Pila o a una nueva Cola o 
volver a la Cola original (reencolarse). Cuando se termine de dar servicio a la Cola original 
(no hay más clientes), debe mostrar la Pila y la Cola generada y comenzar a dar servicio a ambas 
en forma simultánea (a cada elemento de la pila y a cada elemento de la Cola)hasta que una de las 
2 estructuras se quede sin clientes. Mostrar la estructura que queda. "


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

    def sort()
        @arry.sort
    end

    def add_pos(elem,pos)
        @arry[pos]=elem
        @arry.compact
    end
end

class Cola < Lista

    def initialize()
        super()
    end

    def desencolar()
        if size()>0
            aux=first()
            remove(0)
            return aux
        else
            puts "No hay mas elementos en la Cola"
        end
    end

    def encolar(elem)
        add(elem)
    end
end

class Cola_prioridad < Cola
    def initialize()
        super()
      
    end

    def encolar_prioridad(element,prioridad)
        encolar([element,prioridad])
       
    end
    def desencolar_prioridad()
        primero=@arry_ordenado.first()
        @arry_ordenado.remove(0) 
    end

end

class Persona
    def initialize(nombre)
        @nombre = nombre
        @num=rand(1.99)
    end

    def num_cola()
        return @num
    end
end


colap=Cola_prioridad.new
colap.encolar([5,2])