def long_requi(contr)
	if (contr.length>6 && contr.length<20)
		return true
	else 
		return false
	end
end

def first_car(contr)
	car=contr[0]
	if (car>="a")&&(car<="z")
		return true
	else
		return false
	end
end

def not_espacios(contr)
	i=0
	while(i!=contr.length &&contr[i]!=" " )
			i=i+1
				
	end 
	if contr[i]==" "
		return false
	else
		return true
	end
	
end

def es_num(car)
	if(car>="0"&&car<="9")
		return true
	else
		return false
	end
end


def cont_num(contr)
	i=0
	until(i==contr.length||es_num(contr[i]))
		i=i+1
	end 
	if(i==contr.length)
		return false
	else
		return true
	end	
end

def ingrese_contr(contr)
	if(long_requi(contr))
		if(first_car(contr))
			if(not_espacios(contr))
				if(cont_num(contr))
					puts "Contraseña VALIDA"
					return true
				else
					puts "Debe poseer al menos un numero"
					return false
				end
			else
				puts "No debe existir espacios"
				return false
			end
		else
			puts "Primera caracter de la contraseña debe ser una letra"
			return false
		end
	else
		puts "Longitud de la cadena incorrecta"
		return false
	end

end

#main
puts "Consigna"
puts "- Escriba un programa que permita ingresar una contraseña que debe cumplir las siguientes pautas, si las
pautas no se cumplen, se debe solicitar su ingreso nuevamente, informando la falla.
a) Debe tener más de seis caracteres y menos de veinte.
b) Debe comenzar con una letra (a..z)
c) No se permiten espacios en blanco
d) Debe poseer al menos un número (0..9)"
begin
	puts"Ingrese la contraseña:"
	cont =gets.chomp
end until(ingrese_contr(cont))


final=gets.chomp
