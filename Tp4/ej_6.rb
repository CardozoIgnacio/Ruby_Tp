=begin fecha_valida(fecha)
    Recibe una fecha en formato string y se valida el formato de la misma.
    @ fecha : string con el formato aa/mm/aaaa.
    @ return :  Booleano, Verdadero en caso de que sea una fecha valida, Falso en caso contrario.
=end
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

=begin descomponer_fechas(fecha)
    Dada una fecha en formato string descompone dicho string en dia mes y anio
    @ fecha : string con el formato dd/mm/aaaa.
    @ return: asignacion dinamiacia dia,mes,anio todos de formato string
=end
def descomponer_fechas(fecha)
    dia=fecha[0..1].to_s
    mes=fecha[3..4].to_s
    anio=fecha[6..9].to_s
    return  dia,mes,anio
end
=begin control_F(dia,mes,anio)
    Dada una fecha descompuesta en dia mes y anio controla la validez de la misma.
    @ dia : string con el formato dd.
    @ mes : tipo string  con un formato mm.
    @ anio : tipo string  con un formato aaaa.
    @ return Booleano, Verdadero en caso de que sea una fecha valida, Falso en caso contrario.
=end
def control_F(dia,mes,anio)
    valdio=false
    if ((01..31)===dia.to_i)
    if((01..12)===mes.to_i)&&(es_valido(mes,dia)||(mes=="02"&&dia=="29")&& es_bisiesto(anio.to_i))
            if ((1000..9999)===anio.to_i)
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
=begin es_valido(mes,dia)
    Comprueba la validez entre una fecha y un mes.
    @ mes : tipo string  con un formato mm.
    @ dia : tipos string con un formato dd.
    @ return : Booleano,Verdadero en caso de que sea valido, Falso en caso contrario.
=end
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
=begin es_bisiesto(a)
    p: Es divisible entre 4.
    q: Es divisible entre 100.
    r: Es divisible entre 400.
    p&(!q||r) .
    Verifica si el año pasado por parametro es un año bisiesto .
    @ a : es una anio(aaaa) y ademas tiene q ser un entero.
    @ return Booleano, Verdadero en caso de que sea bisiesto, Falso en caso contrario.
=end
def es_bisiesto(a)
    return(a % 4==0)&&(!(a % 100==0)||(a % 400==0))
end

=begin ingresgar_fecha()
    Imprime por pantalla un mensaje y verfica que la fecha sea una fecha valida.
    @return Una fecha valida en string, con le formato dd/mm/aaaa.
=end
def ingresgar_fecha()
    fecha=gets.chomp
    if fecha_valida(fecha)
        return fecha
    else
        puts"Fecha invalida por favor ingrese nuevamente"
        return ingresgar_fecha()
    end
end

=begin dia_sig(dia)
    Dado un dia en formato dd de tipo string calcula el dia siguiente al mismo y los retona con un formato dd.
    @ dia : dias tipo string en formato dd.
    @ return : dia siguiente con un formato dd.
=end
def dia_sig(dia)
    if((1..8)===dia.to_i)
           return "0"+(dia.to_i+1).to_s
    else
           return (dia.to_i+1).to_s
    end
end

=begin mes_sig(mes)
    Dado un mes en formato mm de tipo string calcula el mes siguiente al mismo y los retona con un formato mm.
    @ mes : mes de tipo string en formato mm.
    @ return : dia siguiente con un formato mm.
=end
def mes_sig(mes)
    if((1..8)===mes.to_i)
           return "0"+(mes.to_i+1).to_s
    else
           return (mes.to_i+1).to_s
    end
end
=begin siguiente_dia(fecha)
    Dado una fecha suma un dia
    @ fecha : fecha en formato dd/mm/aaaa
    @ return : fecha en formato dd/mm/aaaa que representa la fecha siguiente a la pasada por parametro
=end
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


=begin fecha_mas_antigua(fecha1,fecha2)
    Dado dos fechas validas calcula cual es la fecha mas actual y cual es la mas antigua
    @ fecha1 : fecha en formato dd/mm/aaaa
    @ fecha2 : fecha en formato dd/mm/aaaa   
    @ return  fechaX,fechaY donde fX es la fecha mas actual.
=end
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
=begin cuenta_reg(fecha1,fecha2)
    Dada dos fechas imprime por pantalla una cuenta regresiva hasta llegar al dia
=end
def cuenta_reg(fecha1,fecha2)
    fecha1,fecha2=fecha_mas_antigua(fecha1,fecha2)
    if(fecha1!=fecha2)
        begin
            fecha2=siguiente_dia(fecha2)
            d2,m2,a2=descomponer_fechas(fecha2)
          
            puts "EL dia es"+ fecha2
        end until(fecha1==fecha2)
    else
        puts "Las fechas son iguales"
    end
end
#main

puts "Escriba  un  programa  similar  al  punto  2  pero  que  al  finalizar  el  ingreso genere  una “cuenta  regresiva”
de días/meses y años desde la fecha más nueva hasta llegar a la fecha más vieja"
puts"-------------------------------------------------------------------------------------------------------------------"

puts "Ingrese fecha 1:"
fecha1=ingresgar_fecha()
puts "Ingrese fecha 2:"
fecha2=ingresgar_fecha()

cuenta_reg(fecha1,fecha2)


final = gets.chomp