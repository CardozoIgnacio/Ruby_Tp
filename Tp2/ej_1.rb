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

puts "Consigna"
puts "Construir una función “controlar_password?” que pida por teclado una cadena y la compare con una
cadena ya almacenada. Si coinciden, la función debe devolver TRUE; en otro caso, devolver FALSE.
Utilizando el resultado de la función mostrar el mensaje “Acceso Permitido” o “Acceso denegado” según
corresponda"
print "Ingrese la contraseña"
contraseña=ingrese_contraseña
if(controlar_pass(contraseña))
	puts "Acceso permitido"
else
	puts "Acceso denegado"
end

final=gets.chomp

