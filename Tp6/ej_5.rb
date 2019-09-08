def ingr_persona (nombre,altura,personas)
    personas[nombre]=altura
end

def altura_men(personas)
    aux=0
    personas.each{ |clave,valor|
        if valor<1.50
            aux=aux+1
        end
    }
    return aux
end

def altura_sup(personas)
    aux=0
    personas.each{ |clave,valor|
        if valor>1.75
            aux=aux+1
        end
    }
    return aux
end

def prom(personas)
    promedio_aux=0
    personas.each{|clave,valor|
        promedio_aux=promedio_aux+personas[clave]        
    }

    return promedio_aux/personas.size()
end

puts "Permita crear un hash de nombres y alturas de personas.
 Escriba procedimientos para obtener los mayores de 1.75m; la
 cantidad de menores de 1,50; el promedio de alturas."

 personas= Hash.new()

 
 begin
    begin
        puts "Ingrese un nombre"
        nombre=gets.chomp
        system("cls")
    end until (!personas.has_key?(nombre))
puts "Ingrese una altura"
altura=gets.chomp.to_f
ingr_persona(nombre,altura,personas)
system("cls")

end until (personas.size()==3)
puts "La cantidad de personas con altura menor a 1.5 es #{ altura_men(personas)}"
puts "La cantidad de personas con altura superior a 1.75 es #{ altura_sup(personas)}"
puts "El promedio de la altura de las personas es  #{ prom(personas)}" 

puts personas