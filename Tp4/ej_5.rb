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
#retorna un string 
#asignacion multiple dias meses anios
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
       if((01..12)===mes.to_i)&&(es_valido(mes,dia)||(mes.to_i==2)&& es_bisiesto(anio.to_i))
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
    if(mes=="01"||mes=="03"||mes=="05"||mes=="07"||mes=="08"||mes=="10"||mes=="12")
        return (1..31)===dia.to_i
    else
        if(mes=="04"||mes=="06"||mes=="09"||mes=="11")
            return (1..30)===dia.to_i
        else
            return (1..28)===dia.to_i
        end
    end
end
#    p: Es divisible entre 4
#    q: Es divisible entre 100
#    r: Es divisible entre 400
#    a: es el anio y ademas tiene q ser un entero
#    p&(!q||r)  

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

def edad(fecha,fechaFinal)
   
    if(fecha==fechaFinal)
           return 0,0,0
    else
           
           dia,mes,anio=descomponer_fechas(fecha)
           dia_n=dia_sig(dia)
           fecha_sig=dia_n+"/"+mes+"/"+anio
            
           if(fecha_valida(fecha_sig))
                  d,m,a=edad(fecha_sig,fechaFinal)
                  return d+1,m,a
           else
                  mes_n=mes_sig(mes)
                  fecha_sig="01"+"/"+mes_n+"/"+anio
                  if(fecha_valida(fecha_sig))
                         d,m,a=edad(fecha_sig,fechaFinal)
                         return d,m+1,a
                  else
                         fecha_sig="01/"+"01/"+(anio.to_i+1).to_s
                          d,m,a=edad(fecha_sig,fechaFinal)
                          return 0,0,a+1
                  end
           end
    end

end



def son_iguales(anio_a,anio_n)
   print anio_a
   print anio_n
    if anio_a==anio_n
           return true
    else
           return false
    end
end

def dia_sig(dia)
 if((1..8)===dia.to_i)
        return "0"+(dia.to_i+1).to_s
 else
        return (dia.to_i+1).to_s
 end
end
def mes_sig(mes)
 if((1..8)===mes.to_i)
        return "0"+(mes.to_i+1).to_s
 else
        return (mes.to_i+1).to_s
 end
end
def mes_dia_format(mesdia)
 if((1..9)===mesdia.to_i)
        return "0"+(mesdia.to_i).to_s
 else
        return (mesdia.to_i).to_s
 end
end
def edad_iter(fecha,fechaFinal)
    dia=0
    mes=0
    anio=0
    dia_c,mes_c,anio_c=descomponer_fechas(fecha)
    begin
           d,m,a=descomponer_fechas(fecha)
           fecha_aux=dia_sig(d)+"/"+mes_dia_format(m)+"/"+a
           dia=dia+1
           if(fecha_valida(fecha_aux))
                  fecha=fecha_aux
                  if(d==dia_c&&m!=mes_c)
                      dia=0
                  end
           else
                  fecha_aux="01"+"/"+mes_sig(m)+"/"+a
                  if(m!=mes_c) 
                     mes=mes+1                        
                  else
                     mes=0
                  end
                  if(fecha_valida(fecha_aux))
                         fecha=fecha_aux                         
                  else
                         fecha="01"+"/"+"01"+"/"+(a.to_i+1).to_s                   
                  end
                 
           end
           d,m,a=descomponer_fechas(fecha)
           if(d==dia_c&&mes_c==m)
             anio=anio+1
             mes=0
             dia=0
                     
           end
          
    end until(fecha==fechaFinal)
    puts "Cantidad de dias #{dia}"
    puts "Cantidad de meses #{mes}"
    puts "Cantidad de años #{anio}"

end

def siguiente_dia(fecha)
    d,m,a=descomponer_fechas(fecha)
    d_n=dia_sig(d)
    fecha_sig=d_n+"/"+m+"/"+a
    if(!fecha_valida(fecha_sig))
        m_n=mes_sig(m)
        fecha_sig="01/"+m_n+"/"+a
        if(!fecha_valida(fecha_sig))
            a=(a.to_i+1).to_s
            fecha_sig="01/01/"+a
        end
    end
    return fecha_sig
end
def fecha_hoy()
    t = Time.now

    dia_a= t.strftime("%d")
    mes_a= t.strftime("%m")
    anio_a= t.strftime("%Y")

    anio_a= dia_a+"/" +mes_a +"/"+anio_a
    return anio_a
end

def calcular_h_dorm_alim(fecha)
    fecha_ac=fecha_hoy()
    suenio=0
    comer=0
    begin
        
        fecha=siguiente_dia(fecha)
        suenio=suenio+8
        comer=comer+2
    end until(fecha==fecha_ac)
    puts "Horas de sueño #{suenio}"
    puts "Horas de comer #{comer}"
end
#main

puts "Utilizando  lo  obtenido  en  el  punto  3  determine  cuántas  horas  ha  dormido  
y  cuántas  ha  estado  comiendo teniendo en cuenta que por día utiliza 8 hs para dormir 
y 2 para alimentarse"
puts "----------------------------------------------------------------------------------"


anio_a= fecha_hoy()

puts "Ingrese la fecha "
fecha=ingresgar_fecha()

calcular_h_dorm_alim(fecha)



