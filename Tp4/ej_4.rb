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

#Retorna fechaX,fechaY donde fX es la fecha mas actual.
def fecha_mas_antigua(fecha1,fecha2)
    d1,m1,a1=descomponer_fechas(fecha1)
    d2,m2,a2=descomponer_fechas(fecha2)
    if(a1.to_i>a2.to_i)
        return fecha1,fecha2
    else
        if(a1.to_i==a2.to_i)
            if(m1.to_i>m2.to_i)
                return fecha1,fecha2
            else
                if(m1.to_i==m2.to_i)
                    if(d1.to_i>d2.to_i)
                        return fecha1,fecha2
                    else
                        if(d1.to_i==d2.to_i)
                            return fecha1,fecha2
                        else
                            return fecha2,fecha1
                        end
                    end
                else
                    return fecha2,fecha1
                end 
            end
        else
            return fecha2,fecha1
        end
    end
end
def calc_anios_b(fecha1,fecha2)
    
end
#main

fecha1=ingresgar_fecha()
fecha2=ingresgar_fecha()

anio_b=calc_anios_b(fecha1,fecha2)