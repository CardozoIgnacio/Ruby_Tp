puts "Desarrolle un programa que permita generar una cola de personas que quieren 
pagar impuestos. Cuando una persona se incorpora a la estructura, esa persona se 
identifica por su nombre y dispone de x facturas a pagar (x al azar, (1 <= x <= 5) 
además cada factura tiene un importe, también al azar). Genere el procedimiento de 
incorporación y servicio de atención para cada persona, informado el total a abonar 
de cada persona. También debe contemplar la posibilidad de informar el total recaudado 
por cobranza. Para mejor control, desarrolle un sencillo menú de opciones para Agregar 
Persona, Dar Servicio, Mostrar Cola, Informar Recaudado"


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

    def cola_nueva(pos)
        cola=Cola.new()
        for a in pos..size()
            cola.encolar(@arry[a])
        end
        return cola
    end
end

class Cola_Pagofacil<Cola
    def initialize()
        super()
        @total_recaudado=0
    end

    def atender_cliente()
        cliente=desencolar()
        facturas= cliente.facturas()
        recaudado=0
        facturas.each do |n|
           recaudado=recaudado+n.importe
        end

        puts "Total abondo  #{recaudado} por el cliente #{cliente.nombre()}"
        @total_recaudado=@total_recaudado+recaudado
    end

    def print()
        @arry.each do |a|
           puts a.nombre
        end
    end

    def informe_recaudacion()
        return @total_recaudado
    end

end

class Cliente 
    @@nombre={1=>"Juan",2=>"Jose",3=>"Tibu",4=>"Gera",5=>"Gino",6=>"Ignacio",7=>"Iñaki",8=>"Genaro",9=>"Juaquin",10=>"Benajamin"}
    def initialize()
        @arry_facturas=Array.new()
        @nombre=@@nombre[rand(1..10)]
        rnd=rand(1..5)
        for i in 1..rnd
            @arry_facturas.push(Factura.new())
        end
    end

    def facturas()
        return @arry_facturas.clone()
    end

    def nombre()
        return @nombre
    end
end

class Factura
    @@hash_empresas={1=>"PAV" , 2=>"Luz" , 3=> "Gas", 4=>"Agua"}
    def initialize()
        rnd_emp=rand(1..4)
        @empresa=@@hash_empresas[rnd_emp]
        @importe=rand(5000..20000)
    end

    def nombre_empresa()
        return @empresa
    end

    def importe()
        return @importe
    end
end





=begin
puts pers2.facturas()[0].importe()
puts pers3.facturas()[0].importe()
puts pers4.facturas()[0].importe()
=end

cola_clientes=Cola_Pagofacil.new()
puts "------------------------------------------------------"
puts "---------Seleccione opcion que desea realizar---------"
puts "------------------------------------------------------"

puts "0- Agregar Persona"
puts "1- Dar Servicio"
puts "2- Mostrar Cola"
puts "3- Informar Recaudado"


cola_clientes.encolar(Cliente.new())
cola_clientes.encolar(Cliente.new())
cola_clientes.encolar(Cliente.new())

cola_clientes.print()

cola_clientes.atender_cliente()