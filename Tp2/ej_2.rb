def controlar_pass(pass)
contr=1234
	if pass==contr
		return true
	else
		return false 
	end
end
def ingrese_contraseña
return gets.chomp.to_i
end

#main
puts "Consigna:"
puts "Modifique el programa anterior para que sólo se permitan 3 intentos de clave no válida."


accesos=0

begin
	puts "Ingrese la contraseña"
	contraseña=ingrese_contraseña
	if(controlar_pass(contraseña))
		puts "Acceso permitido"
		break
	else
		puts "Acceso denegado"	
		accesos=accesos+1
	end
end until (accesos==3||controlar_pass(contraseña))

print "Se excedieron el numero de intentos"
final=gets.chomp
