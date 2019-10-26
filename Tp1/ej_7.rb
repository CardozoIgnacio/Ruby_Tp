def  div_entera(num,den)
	aux=0
	if den>num
		return num
	else
		aux=num-den
		return div_entera(aux,den)
	end

end

def ingres_num()
	return gets.to_i
end

#main

puts "Este programa calcula el resto de una division"
print "Ingrese numerador:"
num=ingres_num
print "Ingrese denominador:"
den=ingres_num

resto=div_entera(num,den)

print " El resto de la division es #{resto}"


final=gets.chomp