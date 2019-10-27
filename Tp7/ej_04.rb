puts "Agregue a la clase Pila un método que permita separar una pila generada 
con elementos al azar en dos nuevas pilas. La primera contendrá elementos pares 
y la segunda contendrá elementos impares. Los elementos de las nuevas pilas deben
 seguir respetando el orden que adquirieron en la pila original"

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
        
        @arry=arry_aux
    end

    def separar_pares_impares()
            
        pila_pares=Pila.new()
        pila_impares=Pila.new()
        
        begin
            elem=desapilar()
            if(elem%2==0)
                pila_pares.apilar(elem)
            else
                pila_impares.apilar(elem)
            end

        end until(size()==0)

        pila_impares.invertirpila()
        pila_pares.invertirpila()

        return pila_pares,pila_impares
        
        
    end
end



pila1=Pila.new

pila1.apilar(5)
pila1.apilar(4)
pila1.apilar(3)
pila1.apilar(2)
pila1.apilar(1)
pila1.apilar(0)


pilaP,pilaI=pila1.separar_pares_impares()



puts""
puts "InPAres"
begin
    puts pilaI.desapilar()
end until pilaI.size()==0


puts""
puts "PAres"
begin
    puts pilaP.desapilar()
end until pilaP.size()==0