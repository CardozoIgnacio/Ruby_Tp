class Seresvivos #clasemadre
    def nacer
        puts"nazco"
    end

    def morir
        puts"muero"
    end
end

class Animales < Seresvivos #clasehijo
    def jugar
        puts"jugar jugar y correr y saltar" + " " + @nombre + " " + @edad.to_s + " " + @raza + " " + @alimento
    end

    def morder
        puts"muerde fuerte" + " " + @nombre + " " + @edad.to_s + " " + @raza + " " + @alimento
    end

    def dormir
        puts"zzzzzz" + " " + @nombre + " " + @edad + " " + @raza
    end
end

class Perro < Animales #clasenieto
    def initialize(nombre,edad,raza) #crea un nuevo integrante dentro de la class?
        #puts " pertenecen al constructor"
        #puts self.object_id # a este objeto, imprimo el id del objeto, es decir a si mismo,
        @@cant_patas=4  #variable de clase
        @nombre=nombre
        @edad=edad #varibale de instancia
        @raza=raza
        @alimento="DogChow" 
    end

    def ladrar
        puts"guau guau" + " " + @nombre + " " + @edad.to_s + " " + @raza + @alimento
    end
    
end

#main
perro1=Perro.new("colita",4,"caniche")
perro2=Perro.new("boby",5,"ody")
puts perro1.methods

#class - methods para los integrantes
