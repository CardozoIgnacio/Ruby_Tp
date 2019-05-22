def fecha_valida(fecha)
    if fecha.length!=10
        return false
    else 
        if (fecha[2]=="/"&& fecha[5]="/")||(fecha[2]=="-"&&fecha[5]=="-")
            dia,mes,anio=descomponer_fechas(fecha)

            return control_F(dia,mes,anio)
        else
            return false
        end
    end
end
def descomponer_fechas(fecha)
    dia=fecha[0..1].to_s
    mes=fecha[3..4].to_s
    anio=fecha[6..9].to_s
    return  dia,mes,anio
end
#dd/mm/aaaa
def control_F(dia,mes,anio)
    valdio=false
    if ((01..31)===dia.to_i)
       if((01..12)===mes.to_i)&&(es_valido(mes,dia)||(mes==2)&& es_bisiesto(anio.to_i))
            if ((1900..2019)===anio.to_i)
                valido= true
            else
                valido= false
            end
        else
            valido= false
        end
    else
        valido= false
    end
    return valido
end

def es_valido(mes,dia)
    if(mes=="1"||mes=="3"||mes=="5"||mes=="7"||mes=="8"||mes=="10"||mes=="12")
        return (1..31)===dia.to_i
    else
        if(mes=="4"||mes=="6"||mes=="9"||mes=="11")
            return (1..30)===dia.to_i
        else
            return (1..28)===dia.to_i
        end
    end
end
#    p: Es divisible entre 4
#    q: Es divisible entre 100
#    r: Es divisible entre 400
#    p&(!q||r)  
#   a : es el anio y ademas tiene q ser un entero
def es_bisiesto(a)
   
   return(a % 4==0)&&(!(a % 100==0)||(a % 400==0))
   
end
def ingresgar_fecha()
    fecha=gets.chomp
    if fecha_valida(fecha)
        return fecha
    else
        puts"Fecha invalida por favor ingrese nuevamente"
        return ingresgar_fecha()
    end
end

def fecha_mas_antigua(fecha1,fecha2)
    d1,m1,a1=descomponer_fechas(fecha1)
    d2,m2,a2=descomponer_fechas(fecha2)
    if(a1.to_i>a2.to_i)
        puts "La #{fecha1} es la mas actual y #{fecha2}es la mas antigua"
    else
        if(a1.to_i==a2.to_i)
            if(m1.to_i>m2.to_i)
                puts "La #{fecha1} es la mas actual y #{fecha2}es la mas antigua"
            else
                if(m1.to_i==m2.to_i)
                    if(d1.to_i>d2.to_i)
                        puts "La #{fecha1} es la mas actual y #{fecha2}es la mas antigua"
                    else
                        if(d1.to_i==d2.to_i)
                            puts "Las fechas son iguales"
                        else
                            puts "La #{fecha2} es la mas actual y #{fecha1}es la mas antigua" 
                        end
                    end
                else
                    puts "La #{fecha2} es la mas actual y #{fecha1}es la mas antigua" 
                end 
            end
        else
            puts "La #{fecha2} es la mas actual y #{fecha1}es la mas antigua"
        end
    end
end
#main
puts "Escriba  un  programa  que  permita  ingresar  dos  fechas  válidas  
      utilizando  lo  construido  en  el  ej. anteriory determine cuál es 
      la más actualy cuál la más vieja."
puts "--------------------------------------------------------------------------"
puts "Ingrese una fecha 1"
fecha1=ingresgar_fecha()
puts "Ingrese una fecha 2"
fecha2=ingresgar_fecha()
fecha_mas_antigua(fecha1,fecha2)

puts gets.chomp