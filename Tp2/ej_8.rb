def long_requi(contr)
	if (contr.length>6 && contr.length<20)
		return true
	else 
		return false
	end
end

def first_car(contr)
	car=contr[0]
	if (car>="A")&&(car<="Z")
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
	cont=0
	until(i==contr.length)
		if(es_num(contr[i]))
			cont=cont+1
		end
		i=i+1
	end 
	return cont
end

def letra_unica(contr,letra)
	i=0
	cont=0
	begin
		if(contr[i]==letra)
			cont=cont+1
		end
		i=i+1
	end until(i==contr.length||cont==2)
	if cont==2
		return false
	else
		return true
	end
end


def cuatro_letras_unicas(contr)
	i=0
	cont_u=0
	begin
		if(!es_num(contr[i])&&letra_unica(contr,contr[i]))
			cont_u=cont_u+1
		end
		i=i+1
	end until(i==contr.length||cont_u>=4)
	if cont_u>=4
		return true
	else
		return false
	end
end

def ingrese_contr(contr)
	if(long_requi(contr))
		if(first_car(contr))
			if(not_espacios(contr))
				if(cont_num(contr)==3)
					if(cuatro_letras_unicas(contr))
						puts "Contraseña VALIDA"
						return true
					else
						puts "Debe poseer al menos cuatro letras que no deben repetirse"
						return false
					end
				else
					puts "Debe poseer tres numeros"
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
puts "- Ídem ejercicio anterior para:
a) Debe tener más de seis caracteres y menos de veinte.
b) Debe comenzar con una letra mayúscula (A..Z).
c) No se permiten espacios en blanco
d) Debe poseer tres números (0..9)
e) Debe poseer al menos cuatro letras que no deben repetirse.
"
begin
	puts"Ingrese la contraseña:"
	cont =gets.chomp
end until(ingrese_contr(cont))


final=gets.chomp