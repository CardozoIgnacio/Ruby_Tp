def invers(cadena)
	largo=cadena.length-1
	nueva=""
	begin
	nueva=nueva+cadena[largo]
	largo=largo-1
	end until largo==-1
	return nueva
end
def ingresar_cadena()
	return gets.chomp.to_s
end


#main
puts "Consigna"
puts "Escriba una función “inverso” que invierta un"

puts "Ingrese una cadena de caracteres"
cadena=ingresar_cadena
inv=invers(cadena)
puts "La cadena invertida es #{inv}"

final=gets.chomp