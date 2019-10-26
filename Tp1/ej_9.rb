def factorial(num)
	if num==1
		return 1
	else
		return num*factorial(num-1)
	end
end
def ingresar_num()
	print "Ingrese un numero:"
	num= gets.chomp.to_i
	if num==0
		puts "Numero ingresado es cero.Ingrese otro numero"
		return ingresar_num
	else
		return num
	end
	
end

#main

puts "Consigna"
puts "Diseñe un algoritmo modular (PROGRAMA) que calcule el factorial de un número ingresado por el usuario.
Considere que el valor a calcular se introduce en el programa principal. P.ej: 9! = 9x8x7x6x5x4x3x2x1 = 362880"
num=ingresar_num
res=factorial(num)

print "El factorial de ese numero es #{res}"

final=gets.chomp.to_i