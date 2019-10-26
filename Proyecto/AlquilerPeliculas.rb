class Cola 
    def initialize()
        @arry=Array.new()
    end
    
    def add(elemnt)
        @arry.push(elemnt)
    end

    def element()
        aux=@arry[0]
        @arry[0]=nil
        @arry=@arry.compact
        return aux
    end

    def size()
        return @arry.size()
    end
end

class Persona
    def initialize(apellido ,nombre,dni,*direccion)
        @nombre=nombre
        @apellido=apellido
        @dni=dni
        @fecha=nil
        @direccion=direccion
    end
    
    attr_accessor :nombre , :apellido 
    def obtener_direccion()
        if @direccion!=nil
           return " #{@direccion[0].calle}  #{@direccion[0].numero} #{@direccion[0].ciudad}"
        else
            return nil
        end

    end

    def cp()
        if @direccion!=nil
            return @direccion.cp
        else
            return nil
        end
    end

    def nomb_comp()
        return @apellido+","+@nombre
    end

    def id()
        return @dni
    end

end

class Empleado < Persona
    @@id_empleado=0
    def initialize(nombre,apellido,dni,*direccion)
        super(nombre,apellido,dni,*direccion)
        @nro_Empleado=@@id_empleado
            @@id_empleado=@@id_empleado+1
        @salario=nil
        @categoria=nil
       
    end
    
    #Metodos de lectura
    attr_reader :nro_Empleado

    def asignar_categoria(num)
        @categoria= Categoria.new(num)
    end

    def salario()
        if @categoria==nil
            return nil
        else
            return @categoria.salario()
        end
    end

    def id()
        return @nro_Empleado
    end 
 
end

class Gerente < Empleado
    def initialize(nombre,apellido,dni,*direccion)
       
        super(nombre,apellido,dni,*direccion)
       
        @sucursal=nil               
    end

    #Metodos de lectura
    def sucursal()
            return @sucursal
    end

    #Metodos de asignacion
    def asignar_Sucursal(sucursal)
        @sucursal=sucursal
    end

end

class Categoria
    def initialize(num)
        @tipo=num
        @salario=[24000,30000,50000]
    end

    def salario(num)
        if num<=@salario.size()
            return @salario[num-1]
        else
            return nil
        end
    end

end

class Cliente < Persona
    @@id_cliente=0
    def initialize(nombre,apellido,dni,calle,numero,ciudad,cp)
        direccion=Direccion.new(calle,numero,ciudad,cp)
        super(nombre,apellido,dni,direccion)
        @direccion=Direccion.new(calle,numero,ciudad,cp)
        @descuento=0
        @numero_cliente=@@id_cliente        
        @@id_cliente=@@id_cliente+1
        @cantidad_peliculas=0
    end

    attr_reader :numero_cliente, :descuento
    
    def id()
        return @numero_cliente
    end
    private
    def sumar_historial()
        @cantidad_peliculas=@cantidad_peliculas+1
    end
    
    private
    def descuento()
        descuento=0
        if (@cantidad_peliculas>50)
            descuento= 10
        end
        return descuento        
    end

end


class Pelicula
    @@id_pelicula=0
    def initialize(nombre,estado,costo)
        @nombre=nombre
        @num_pelicula=@@id_pelicula
            @@id_pelicula=@@id_pelicula+1
        @estado=estado        
        @costo=costo
        @categoria={'Accion'=>false,'Adulto'=>false,'Infantil'=>false,'Drama'=>false,'Terror'=>false,'CienciaFiccion'=>false,}
        @director=Array.new()
        @actor=Array.new()
        @cantidad=Array.new() #arreglo de copias
        #Cuando se crea una pelicula por defecto esta tiene una pelicula asociada 
        @cantidad.push(Copia.new(@num_pelicula,@cantidad.size()))
    end

    #Metodos de lectura
    attr_reader :num_pelicula, :estado,  :costo, :nombre

    #Retorna un arreglo de las categorias que conforman esta pelicula
    def categorio( )
        arry_aux=Array.new()
        @categoria.each{|key,value|
             if value==true
                arry_aux.push(key)
            end
                        }
        return arry_aux
    end

    #Dada una categoria establece dicha catogoria dentro de la pelicula
    def set_categoria(key)
        if (@categoria.has_key?(key))
            @categoria[key]=true
        else
            return nil
        end
    end

    def director()
        return @director.clone()
    end

    def actores()
        return @actores.clone()
    end

    def cant_copias()
    end
    #Metodos de escritura
    
    #Asigna una categoria a la pelicula, si la categoria ingresada es incorrecta retornara nulo
    def asignar_categoria(key_categ)
        if @categoria.has_key?
            @categoria[key_categ]=true
        else
            return nil
            
        end
    end

    #Asigna un director a la pelicula
    def asignar_director(director)
        @director.push(director)
    end

    #Asigna un actor a la pelicula
    def asignar_actor(actor)
        @actor.push(actor)
    end

    #Agrega un nueva copia 
    def agregar_copia()
        @cantidad.push(Copia.new(@num_pelicula,@cantidad.size()))
    end

    #Agrega un nueva copia Delux
    def agregar_copia_delux()
        copia_pelicula=Copia.new(@num_pelicula,@cantidad.size())
        copia_pelicula.establecer_delux()
        @cantidad.push(copia_pelicula)        
    end
    
end

class Direccion
    def initialize(calle,numero,ciudad,cp)
        @calle=calle
        @ciudad=ciudad
        @cp=cp
        @numero=numero
    end

    #Lectura escritura de los atributos que componen una direccion
    attr_accessor :calle, :ciudad,:cp
    def numero()
        return @numero
    end
end

class Sucursal
    @@cant_sucursal=0

    def initialize(direccion,nro_tel)
        @direccion=direccion
        @nro_tel=nro_tel
        @nro_suc=@@cant_sucursal
        @@cant_sucursal=@@cant_sucursal+1
        @peliculas=Array.new()
        @clientes=Array.new()
        @alquiler=Hash.new()
        @gerente=nil
    end
    

    attr_accessor :nro_tel, :nro_suc, :gerente
    #----------------------
    #---------Getrs--------
    #----------------------

    #Dado el id de un cliente retorna una copia de dicho cliente, caso contrario retorna nil
    def get_list_cliente()
        return @clientes.clone
    end

    def get_list_peliculas()
        return @peliculas.clone
    end
    
    def get_cliente(nro_cliente)
        if @cliente.size()>nro_cliente
            return @clientes[nro_cliente].clone()
        else
            return nil
        end
    end

    def get_peliculas()
        peliculas=Array.new()
        @pelicula.each{|pel|
            pelicula.push(pel.nombre)
                      }
        return pelicula
    end
    def get_direccion()
        
        aux= "Calle: #{@direccion.calle.to_s}  numero #{@direccion.numero.to_s}  Ciudad:  #{@direccion.ciudad.to_s}  Codigo Postal  #{@direccion.cp.to_s}"

        return aux
    end
    private
    def encontrar_pelicula(nombre)
        i=0
        @pelicula.each{|pel|
            if pel.nombre==nombre
                return pel
            end
        }
    end

  
    #-----------------------
    #--------SEters---------
    #-----------------------

    #Recibe una clase Pelicula de video
    public
    def add_pelicula(nombre,estado,costo)
        @peliculas.push(Pelicula.new(nombre,estado,costo))
    end
    #Agrega un nuevo cliente a la estructura
    def add_cliente(nombre,apellido,dni,calle,numero,ciudad,cp)
        @clientes.push(Cliente.new(nombre,apellido,dni,calle,numero,ciudad,cp))
    end
    def add_gerente(gerente)
        @gerente=gerente
    end

  
end

class Alquiler
    @@id_alquiler=0
    def initialize()
        @id=@@id_alquiler
            @@id_alquiler=@@id_alquiler+1
        @cliente=nil        
    end
end

class Copia 
    
    def initialize(id_pelicula,cantidad)
        # identificador de la copia, esta compuesto por el id de la pelicula y la cantidad de peliculas que hay asociadas a dicha copia
        @num_copia=id_pelicula.to_s+"-"+cantidad.to_s
        @delux=nil
    end

    attr_reader :num_copia,  :estado, :delux

    def establecer_delux()
        @delux=true
    end

end

#main
system("clear")

d_suc1=Direccion.new("Passo",5001,"Punta Alta",8109)
d_suc2=Direccion.new("Passo",5002,"Punta Alta",8109)
d_suc3=Direccion.new("Passo",5003,"Punta Alta",8109)
suc1=Sucursal.new(d_suc1,455555)
suc2=Sucursal.new(d_suc2,455556)
suc3=Sucursal.new(d_suc3,455557)

puts"--------------------------------------------------------------"
puts"---------------------Sistema Alquiler-------------------------"
puts"--------------------------------------------------------------"
puts
puts "El sistema cuenta con las siguientes sucursales"
puts
print "El id de la Sucursal Nº1 es "
puts suc1.nro_suc
puts "   En la direccion "+  suc1.get_direccion
puts
print "El id de la Sucursal Nº2 es "
puts suc2.nro_suc
puts "   En la direccion "+  suc2.get_direccion
puts
print "El id de la Sucursal Nº3 es "
puts suc3.nro_suc
puts "   En la direccion "+  suc3.get_direccion
puts
puts "Funcionamiento de varialbes globales"
puts
puts



direcc1=Direccion.new("Roca",001,"Punta Alta",8019)
gerent1=Gerente.new("Cardozo","Ignacio","00.000.004",direcc1)
suc1.add_gerente(gerent1)

puts "Presione AnyKey and Enter"
siguiente_pantalla=gets.chomp
system("clear")
puts"--------------------------------------------------------------"
puts"---------------------Sistema Alquiler-------------------------"
puts"--------------------------------------------------------------"
puts
puts "La sucursal 1 cuenta con el gerente #{suc1.gerente.nomb_comp()}"
puts 
puts "Con direccion:"
puts  suc1.gerente.obtener_direccion
puts

puts "Presione AnyKey and Enter"
siguiente_pantalla=gets.chomp
system("clear")
puts"--------------------------------------------------------------"
puts"---------------------Sucursal Nº1-----------------------------"
puts"--------------------------------------------------------------"
puts
puts "Peliculas de la sucursal 1:"
puts
# add_pelicula(nombre,estado,costo,titulo)
suc1.add_pelicula("Terminator","Nuevo",25.00)
suc1.add_pelicula("Matrix","Nuevo",25.00)
suc1.add_pelicula("Tiburon","Nuevo",25.00)

suc1.get_list_peliculas.each{|pelicula|
    puts "Nombre: #{pelicula.nombre}"
    puts "Id: #{pelicula.num_pelicula}"
}

puts "Desea agregar mas peliculas(S/N)"
confirmacion=gets.chomp

if(confirmacion=="S")
    begin
        system("clear")
        puts"--------------------------------------------------------------"
        puts"---------------------Sucursal Nº1-----------------------------"
        puts"--------------------------------------------------------------"
        puts
        puts "Ingresar nueva pelicual"
	puts
        puts "Ingres nombre:"
        nombre=gets.chomp
        puts "Ingrese detalles de la pelicual(Nueva,Rayado,etc)"
        estado=gets.chomp
        puts "Ingrese precio de alquiler"
        precio=gets.chomp.to_i
        suc1.add_pelicula(nombre,estado,precio)
        system("clear")
        puts"--------------------------------------------------------------"
        puts"---------------------Sucursal Nº1-----------------------------"
        puts"--------------------------------------------------------------"
        puts
        puts "Desea ingrear otra pelicula(Y/N)"
        nuevo=gets.chomp
    end  until( nuevo == "N")  
    system("clear")
    puts"--------------------------------------------------------------"
    puts"---------------------Sucursal Nº1-----------------------------"
    puts"--------------------------------------------------------------"
    puts
    puts "Peliculas de la sucursal 1:"
    puts
    # add_pelicula(nombre,estado,costo,titulo)

    suc1.get_list_peliculas.each{|pelicula|
        puts "Nombre: #{pelicula.nombre}"
        puts "Id: #{pelicula.num_pelicula}"
    }
end



system("clear")
puts"--------------------------------------------------------------"
puts"---------------------Sucursal Nº1-----------------------------"
puts"--------------------------------------------------------------"
puts
puts "Clientes de la sucursal 1:"
puts

suc1.add_cliente("Juan","Castelli","00.000.001","Passo",2000,"Punta Alta",8109)
suc1.add_cliente("Gino","Rossi","00.000.002","Roca",1500,"Punta Alta",8109)
suc1.add_cliente("Gerardo","Sardinez","00.000.003","25 de Mayo",700,"Punta Alta",8109)

suc1.get_list_cliente().each{|cliente|
    puts "El cliente con id  #{cliente.id} "
    puts "Nombre del cliente "+cliente.nomb_comp

}

puts "Desea agregar mas clientes(S/N)"
confirmacion=gets.chomp

if(confirmacion=="S")
    begin
        system("clear")
        puts"--------------------------------------------------------------"
        puts"---------------------Sucursal Nº1-----------------------------"
        puts"--------------------------------------------------------------"
        puts
        puts "Agregar nuevo cliente"
	puts
        puts "Ingres nombre:"
        nombre=gets.chomp
        puts "Ingres apellido:"
        apellido=gets.chomp
        puts "Ingrese Dni"
        dni=gets.chomp
        system("clear")
        puts"--------------------------------------------------------------"
        puts"---------------------Sucursal Nº1-----------------------------"
        puts"--------------------------------------------------------------"
        puts
        puts "Ingrese direccion del nuevo socio"
	puts
        puts "Nombre de la calle"
        calle=gets.chomp
        puts "Ingrese numero"
        num=gets.chomp
        puts "Ingrese la ciudad"
        ciud=gets.chomp
        puts "Ingrese Codigo Postal"
        cp=gets.chomp
        suc1.add_cliente(nombre,apellido,dni,calle,num,ciud,cp)
        system("clear")
        puts"--------------------------------------------------------------"
        puts"---------------------Sucursal Nº1-----------------------------"
        puts"--------------------------------------------------------------"
        puts
        puts "Desea ingrear otro Usuario(Y/N)"
        nuevo=gets.chomp
    end  until nuevo == "N"
    system("clear")
    puts"--------------------------------------------------------------"
    puts"---------------------Sucursal Nº1-----------------------------"
    puts"--------------------------------------------------------------"
    puts
    puts "Clientes de la sucursal 1:"
    puts
    
    suc1.get_list_cliente().each{|cliente|
        puts "El cliente con id  #{cliente.id} "
        puts "Nombre del cliente "+cliente.nomb_comp
    
    }
end

