def ingreso_datos()
	print "Ingrese un numero:"
	return gets.chomp.to_i
end
def suma_num(num1,num2)
	num3=num1+num2	
	print num3.to_s
end

#main
puts "Consigna:"
puts " Diseñe un algoritmo modular (PROGRAMA) que calcule la suma de 2 números ingresados por el usuario.
Considere que los valores se introducen en el programa principal. Indique cómo se pasan los parámetros al
subprograma."
num1=ingreso_datos()
num2=ingreso_datos()
print "La suma de los numeros es: "
suma_num(num1,num2)


Final=gets.chomp