# GENERE 2 COLAS, UNA DE APELLIDOS Y OTRA DE NOMBRES
# SOLAMENTE DE MUJERES
# TOMANDO DATOS DE UN ARCHIVO CON FORMATO FIJO
# SEPARANDO ADECUADAMENTE LOS DATOS 
# LUEGO DE SERVICIO A AMBAS COLAS HASTA QUEDARSE SIN ELEMENTOS

class Cola
  def initialize
	@q = Array.new		
  end
  def encolar(dato)
     @q.push(dato)
  end 
  def servicio
	@q.shift			
  end
  def cola_vacia?
    if (@q.length == 0)
       return true
    else
       return false
    end
  end		
end

def separar(txt,campo)
   cont=0
   texto=""
   i = 0
   begin 
      if (txt[i]==",")
         cont=cont+1
      else
        if (cont+1==campo)
           texto=texto+txt[i]
        end
      end
      i=i+1 
   end until (i==txt.length or cont==campo)
   return texto
end

cape=Cola.new
cnom=Cola.new

arch=File.new("./datos1.dat","r")
begin
    renglon=arch.gets.chomp
    ape=separar(renglon,1)
    nom=separar(renglon,2)
    dir=separar(renglon,3)
    sex=separar(renglon,4)

    if (sex=="FEMENINO")
      cape.encolar(ape)
      cnom.encolar(nom)
    end
end until (arch.eof()==true)
arch.close

while (cnom.cola_vacia?()==false)
    a=cnom.servicio
    b=cape.servicio
    puts "#{a} #{b} fue atendido"
end		
