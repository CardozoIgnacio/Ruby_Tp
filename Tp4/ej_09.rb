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
=begin son_iguales(fecha1,fecha2)
    Dados dos fechas en formato string determina si las fechas son igualse.
    @ fecha1
    @ fecha2
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

=begin ingresgar_fecha()
   Imprime por pantalla un mensaje y verfica que la fecha sea una fecha valida
   @return Una fecha valida en string, con le formato dd/mm/aaaa
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
=begin formato_fecha()
    Recibe un entero dia,mes y anio y lo transforma a formato fecha
    @return fecha de formato dd/mm/aaaa
=end
def formato_fecha(d,m,a)
    if (d<=9)
        dia="0"+d.to_s
    else
        dia=d.to_s
    end
    if (m<=9)
        mes="0"+m.to_s
    else
        mes=m.to_s
    end
   
    
    return dia+"/"+mes+"/"+a.to_s
end
=begin generar_fecha()
    Genera un fecha aleatoria valida
    @return fecha, string con formato dd/mm/aaaa
=end
def generar_fecha()
    dia=rand(1...31)
    mes=rand(1...12)
    anio=rand(1800...2019)
    fecha=formato_fecha(dia,mes,anio)
    if fecha_valida(fecha)
        return fecha
    else
        return generar_fecha()
    end
end
=begin acierto_parcial(fecha_ing,fecha_control)
    Imprime por pantalla los aciertos parciales de la fecha
    @ fecha_ing string fecha, con el formato dd/mm/aaaa
    @ fecha_control string fecha, con el formato dd/mm/aaaa
=end
def acierto_parcial(fecha_ing,fecha_control)
    di,mi,ai=descomponer_fechas(fecha_ing)
    dc,mc,ac=descomponer_fechas(fecha_control)
    if(di==dc)
        puts "Acertaste el dia"
    else
        if(di>dc)
            puts "Dia ingresado mayor que el dia de control"
        else
            puts "Dia ingresado menor que el dia de control"
        end
    end
    if (mi==mc)
        puts "Acertaste el mes"
    else
        if(mi>mc)
            puts"Mes ingresado mayor que el mes de control"
        else
            puts "Mes ingresado menor que el mes de control"
        end
    end
    if(ai==ac)
        puts "Acertaste el anio"
    else
        if(ai>ac)
            puts "Anio ingresado mayor que el anio de control"
        else
            puts "Anio ingresado menor que el anio de control"
        end
    end
end

=begin
    Dada una fecha generada al azar, permite al usuario ingersar una fecha, informando cuales fueron acertadas
=end
def adivinarfecha(fecha_control)
    puts "Adivine la fecha, por favor :"
    contador=0
    begin
        puts "Ingrese la fecha:"
        fecha_ing=ingresgar_fecha()
        acierto_parcial(fecha_ing,fecha_control)
        contador=contador+1
    end until(son_iguales_fechas(fecha_control,fecha_ing))
    puts "Exito.Se realizaron #{contador} intentos antes de poder acertar la fecha"
end


=begin
   Testeo
=end
def adivinarfecha_t(fecha_control)
    
    contador=0
    begin
        fecha_ing=generar_fecha()
		        acierto_parcial(fecha_ing,fecha_control)

        contador=contador+1
    end until(son_iguales_fechas(fecha_control,fecha_ing))
    puts fecha_control
    puts fecha_ing
    puts "Exito.Se realizaron #{contador} intentos antes de poder acertar la fecha"
end

puts "Escriba un programa que genere al azar una fecha válida (dd/mm/aaaa) 
y permita al usuario adivinar la fecha generada,  informando al  final
la  cantidad  deintentos  realizados  por  el  usuario,  e informándole
si  ya  adivinó  el día, mes y/o año."
puts "-------------------------------------------------------------------------"

fecha =generar_fecha()
adivinarfecha_t(fecha)

final=gets.chomp