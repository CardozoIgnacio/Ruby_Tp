puts "Agregue a la clase Pila del ej.1 un método (comportamiento) 
llamado invertirpilaque invierta el contenido de la pila "


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

    def invertirpila()
        arry_aux=[]
        begin
            arry_aux.push(desapilar())
        end until (size==0)
        puts "El arreglo es"
        puts arry_aux
        @arry=arry_aux
    end
end


#main

puts "Se encolan elemento 5-4-3-2-1-0"
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




pila1.invertirpila() 

puts "La pila invertida es"
begin
    puts pila1.desapilar()
end until pila1.size==0
