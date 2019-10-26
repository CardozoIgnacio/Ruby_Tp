def coeficiente(a,b,c)
	if(a==0)
		if(b==0)
			puts "Grado 0"
		else
			puts "Grado 1"
		end
	else
		puts "Grado 2"
	end

end
def ingreso_datos
	return gets.chomp.to_i		
end
#main

puts "Consigna"
puts "Diseñe un algoritmo modular (PROGRAMA) que calcule el grado de una ecuación cuadrática (ax2
+bx+c).
Considere que los coeficientes a, b y c son ingresados en el programa principal. Indique cómo se pasan los
parámetros al subprograma. "
print "Ingrese un coeficiente A:"
a=ingreso_datos
print "Ingrese un coeficiente B:"
b=ingreso_datos
print "Ingrese un coeficiente C:"
c=ingreso_datos
coeficiente(a,b,c)

final=gets.chomp