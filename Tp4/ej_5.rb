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


=begin son_iguales(anio_a,anio_n)
    Dados dos anios en formato string determina si los anios son igualse.
    @ anio_a : anio actual .
    @ anio_n : anio de nacimiento.
    return booleano, si los anios son iguales retorna true caso contrario retorna falso.
=end
def son_iguales(anio_a,anio_n)
    print anio_a
    print anio_n
     if anio_a==anio_n
            return true
     else
            return false
     end
end


=begin son_iguales(fecha1,fecha2)
    Dados dos fechas en formato string determina si las fechas son igualse.
    @ fecha1 string fecha valida con el formato por dd/mm/aaaa
    @ fecha2 string fecha valida con el formato por dd/mm/aaaa
    return booleano, si las fechas son iguales retorna true caso contrario retorna falso.
=end
def son_iguales_fechas(fecha1,fecha2)
    f1=fecha1[0..1]+fecha1[3..4]+fecha1[6..9]
    f2=fecha2[0..1]+fecha2[3..4]+fecha2[6..9]
     if f1==f2
            return true
     else
            return false
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


=begin fecha_hoy()
    Def para obtener la fecha actual
    @ return  La fecha actual en forma dd/mm/aaaa.
=end
def fecha_hoy()
    t = Time.now

    dia_a= t.strftime("%d")
    mes_a= t.strftime("%m")
    anio_a= t.strftime("%Y")

    anio_a= dia_a+"/" +mes_a +"/"+anio_a
    return anio_a
end

=begin calcular_h_dorm_alim(fecha)
    Calcula la cantidad de horas dormidas y alla canitdad de horas que ha pasado comiendo
    Imprime por pantalla la canitda de horas de sueño y de comer.
    @fecha : fecha de nacimiento en formato dd/mm/aaaa
    
=end
def calcular_h_dorm_alim(fecha)
    fecha_ac=fecha_hoy()
    suenio=0
    comer=0
    begin
        
        fecha=siguiente_dia(fecha)
        suenio=suenio+8
        comer=comer+2
    end until(son_iguales_fechas(fecha,fecha_ac))
    puts "Horas de sueño #{suenio}"
    puts "Horas de comer #{comer}"
end
#main

puts "Utilizando  lo  obtenido  en  el  punto  3  determine  cuántas  horas  ha  dormido  
y  cuántas  ha  estado  comiendo teniendo en cuenta que por día utiliza 8 hs para dormir 
y 2 para alimentarse"
puts "----------------------------------------------------------------------------------"




puts "Ingrese la fecha "
fecha=ingresgar_fecha()

calcular_h_dorm_alim(fecha)


final=gets.chomp
