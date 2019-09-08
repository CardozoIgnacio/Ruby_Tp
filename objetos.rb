#Clase Instituto
class Instituto
    #Constructor de la clase
    def initialize(nombre, ciudad)
        @nombre = nombre
        @ciudad = ciudad
        @alumnos = Array.new
        @materias = Array.new
        @profesores = Array.new
    end
    
    #metodo para agregar un alumno
    def añadirAlumno(alumno)
        @alumnos.push(alumno)
    end

    #metodo para agregar un profesor
    def añadirProfesor(profesor)
        @profesores.push(profesor)
    end

    #metodo para agregar una materia
    def añadirMateria(materia)
        @materias.push(materia)
    end

    #Accesor de lectura
    attr_reader :alumnos, :materias, :profesores
end

#Clase Persona
class Persona
    #Constructor de la clase persona
    def initialize(nombre, edad)
        @nombre = nombre
        @edad = edad
    end

    #Accesor de lectura y escritura
    attr_accessor :nombre, :edad
end

#Clase alumno que Hereda el comportamiento de Persona
class Alumno < Persona
    #Constructor de la clase
    def initialize(nombre, edad, carrera, legajo)
        @carrera = carrera
        @legajo = legajo
        super nombre, edad
    end

    #Accesor de lectura y escritura
    attr_accessor :carrera, :legajo 
end

#Clase Profesor que Hereda el comportamiento de una Persona
class Profesor < Persona
    #Constructor de la clase Profesor
    def initialize(nombre, edad, id)
        @id = id
        super nombre, edad
    end
end

#Clase Materia
class Materia 
    #Constructor de la clase Materia
    def initialize(nombre, profesor)
        @nombre = nombre
        @profesor = profesor
    end
    attr_accessor :nombre, :profesor
end

instituto1 = Instituto.new("I.S.F.T 190", "Punta Alta")
alumno1 = Alumno.new("Gino", "19", "Sistemas", "6198")
profesor1 = Profesor.new("Jorge", "42", 5)
programacion1 = Materia.new("Programacion I", profesor1) 
analisis1 = Materia.new("Analisis Matematico I", profesor1)

instituto1.añadirMateria(programacion1)
instituto1.añadirMateria(analisis1)
instituto1.añadirAlumno(alumno1)
instituto1.añadirProfesor(profesor1)

instituto1.profesores[1]="sdfasf"
puts instituto1.profesores[0].nombre 
print instituto1.profesores[1]
puts "\n"
print instituto1.materias[0].nombre
puts "\n"
print instituto1.materias[1].nombre
puts "\n"
print instituto1.alumnos[0].nombre