class Pila
   def initialize
       @p=Array.new
   end
  def agregar(elem)
      @p.push(elem)
  end
  def desapilar
      @p.pop
  end
  def pila_vacia?
       if (@p.length == 0)
          return true
       else
         return false
       end
  end
  def mostrarpila
      i=@p.length-1
      begin
           puts @p[i]
           i=i-1
     end until (i<0)
  end
end

def ejercicio1
if File.exist?("d:/archivos/datos.dat")
    arch=File.new("d:/archivos/datos.dat","a")
else
    arch=File.new("d:/archivos/datos.dat","w")
end
begin
    print "ingrese un nombre "
    nom=gets.chomp
    arch.puts(nom)
    print "Incorpora otro nombre ? (s/n) "
    resp=gets.chomp
end until (resp=="n" or resp=="N")
arch.close
end

def ejercicio2
    # paso los datos del archivo a una pila
     pila1=Pila.new
     arch=File.new("d:/archivos/datos.dat","r")
     begin
          nombre=arch.gets.chomp
          pila1.agregar(nombre)
    end until (arch.eof()==true)
    arch.close
   #recorro la pila y la vacio generando un nuevo archivo
    arch=File.new("d:/archivos/nuevo.dat","w")
    begin
          if (pila1.pila_vacia?()==false)
                  nom=pila1.desapilar
                  arch.puts(nom)
          end
    end until (pila1.pila_vacia?()==true)    
    arch.close

end

def ejercicio3
#if File.exist?("d:/archivos/datos.dat")
#   arch=File.new("d:/archivos/datos1.dat","a")
#else
#    arch=File.new("d:/archivos/datos1.dat","w")
#end
#begin
#    print "ingrese un nombre "
#    nom=gets.chomp
#    arch.puts(nom)
#    print "Incorpora otro nombre ? (s/n) "
#    resp=gets.chomp
#end until (resp=="n" or resp=="N")
#arch.close

arch1=File.new("d:/archivos/datos.dat","r")
arch2=File.new("d:/archivos/datos1.dat","r")
arch3=File.new("d:/archivos/todo.dat","w")

begin
       if (arch1.eof()==false)       
           renglon = arch1.gets.chomp
           arch3.puts(renglon)
       end 
       if (arch2.eof()==false)       
           renglon = arch2.gets.chomp
           arch3.puts(renglon)
       end 
end until (arch1.eof()==true and arch2.eof()==true)

arch1.close
arch2.close
arch3.close
end

def ejercicio4
arch1=File.new("d:/archivos/datos.dat","r")
arch2=File.new("d:/archivos/sueldos.dat","w")
begin
     nom=arch1.gets.chomp
     print "ingrese el sueldo para #{nom} : "
     sueldo=gets.chomp
     renglon = nom + "," + sueldo
     arch2.puts(renglon)     
end until (arch1.eof()==true)
arch1.close
arch2.close

end

def ejercicio5
arch2=File.new("d:/archivos/sueldos.dat","r")
mayor=0
begin
     renglon=arch2.gets.chomp
     nom=""
     sue=""
     enc = false
     for i in 0..renglon.length-1
           if (renglon[i]==",")
               enc=true
           end
           if (enc==false and renglon[i]!=",")
                nom=nom+renglon[i]
           else
               if (renglon[i]!=",")
                   sue=sue+renglon[i]
               end
           end
     end
   
     if (sue.to_f > mayor)
           mayor = sue.to_f
           nommayor = nom
     end
end until (arch2.eof()==true)
arch2.close
puts "el que mas cobra es #{nommayor} con $ #{mayor}"
end


#ejercicio1
#ejercicio2
#ejercicio3
#ejercicio4
ejercicio5




