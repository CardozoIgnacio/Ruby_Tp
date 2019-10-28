puts "Desarrolle la programación necesaria para implementar una Clase llamada Cola y otra llamada Pila
y defina y programe los métodos necesarios para realizar las operaciones elementales (comportamientos)
sobre estas estructuras de datos.Los elementos de la cola deben ser nombres de personasque se toman 
al azar desde un Array"

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


#main

cola1=Cola.new()
cola1.encolar("5")
cola1.encolar("4")
cola1.encolar("3")
cola1.encolar("2")
cola1.encolar("1")
cola1.encolar("0")


begin
puts cola1.desencolar()
end until cola1.size==0

puts "Se aplian elemento 5-4-3-2-1-0"
pila1=Pila.new()
pila1.apilar("5")
pila1.apilar("4")
pila1.apilar("3")
pila1.apilar("2")
pila1.apilar("1")
pila1.apilar("0")


begin
    puts pila1.desapilar()
end until pila1.size==0
    