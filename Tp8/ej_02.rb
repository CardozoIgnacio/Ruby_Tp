puts "Con el archivo anterior, pase todos los datos del mismo a una pila,
 y luego recorra la pila y pase los elementos a un nuevo archivo. 
 (El nuevo archivo quedará grabado en orden inverso al original)."
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

arch=File.new("./Datos/datos_ej01.data","r")
pila_cont=Pila.new()

arch.each do |linea|
    pila_cont.apilar( linea  )
end

arch2=File.new("./Datos/datos_ej02.data","w")
begin
    elem=pila_cont.desapilar()
    arch2.write(elem)
end until pila_cont.size()==0
arch2.close

arch2=File.new("./Datos/datos_ej02.data","r")
arch2.each do |renglon|
    puts renglon
end