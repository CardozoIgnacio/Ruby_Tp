puts "Diseñe un programa en donde pueda generar una cola de N personas.
Los nombres de las personas los debe tomar de un hash previamente cargado
que contenga nombresy posición que va en la estructura. Diseñe un método 
llamado colanueva en donde para determinada posición de la cola original,
todos los elementos posteriores al mismo pasan a la nueva cola, liberando la original."

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

    def cola_nueva(pos)
        if(pos>=0 && pos<size())    
            
        end
    end
end


persona=Hash.new()

persona[2]=["Gino",nil]
persona[1]=["Jose",nil]
persona[0]=["Juan",nil]
persona[3]=["Ignacio",nil]
persona[4]=["Gerardo",nil]

cola=Cola.new()

begin
    rnd=rand(0..4)
    if persona[rnd][1]==nil
        persona[rnd][1]= cola.size()
        cola.encolar(persona[rnd])
    end
end until(cola.size()==5)


begin 
    puts cola.desencolar()[0]
end until (cola.size()==0)
