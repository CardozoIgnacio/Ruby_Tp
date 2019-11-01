puts "Para cada registro del archivo creado en el punto1, solicite
el ingreso del suelod de cada persona y guarde esa dupla (nombre+sueldo)
eb yb byevi archivo.(El dato sueldo debe estar formateado a un tamaño gual para todos los registros)"


def formatera_sueldo(sueldo,cant)
      while (cant!=sueldo.size())
        sueldo="0"+sueldo
    end
    return sueldo
end

def formato_columan(elem,espaciado)
    while (espaciado!=elem.size())
        elem=elem+" "
    end
    return elem
end


arch_nombre=File.new("./Datos/datos_ej01.data","r")
arch_sueldo=File.new("./Datos/datos_ej04.data","w")


arch_nombre.each do |nombre|
    nombre=nombre.chomp
    sueldo=gets.chomp.to_s 
    registro=formato_columan(nombre,15)+ formatera_sueldo(sueldo,8)
    arch_sueldo.puts(registro)
end