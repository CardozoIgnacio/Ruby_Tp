def ingreso_cadena()
	puts "Ingrese una cadena de mas de 20 caracteres"
	cadena=gets.chomp
	if cadena.length>20
		return cadena
	else
		puts "Cadena no cumple con los parametros establecidos"
		return ingreso_cadena()
	end	
end

def es_vocal(char)
	if(char=="a"||char=="e"||char=="i"||char=="o"||char=="u"||char=="A"||char=="E"||char=="I"||char=="O"||char=="U")
		return true
	else
		return false
	end
end

def cadena_sin_vocales(cadena)
	i=0
	caden_aux=""
	begin
		if(!es_vocal(cadena[i]))
			caden_aux=caden_aux+cadena[i]
		end
		i=i+1
	end until(i==cadena.length)
	return caden_aux
end
#main
puts "Consigna"
puts "Escriba un programa que permita ingresar una cadena de más de 20 caracteres y devuelva la misma cadena
pero sin vocales."
cadena=ingreso_cadena
cadena_nueva=cadena_sin_vocales(cadena)

print cadena_nueva

final=gets.chomp