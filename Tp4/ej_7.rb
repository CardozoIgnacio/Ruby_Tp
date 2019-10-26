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
=begin mes_cad(mes)
    Dado un mes en string con el formato mm se retorna su equivalente en formato cadena MES.
    @ mes : string con el formato mm.
    return String con el nombre del mes.
=end
def mes_cad(mes)
    cadena_mes=""
    case mes
    when  "01"
        cadena_mes="Enero"
    when "02"
        cadena_mes="Febrero"
    when "03"
        cadena_mes="Marzo"
    when "04"
        cadena_mes="Abril"
    when "05"
        cadena_mes="Mayo"
    when "06"
        cadena_mes="Junio"
    when "07"
        cadena_mes="Julio"
    when "08"
        cadena_mes="Agosto"
    when "09"
        cadena_mes="Septiembre"
    when "10"
        cadena_mes="Octubre"
    when "11"
        cadena_mes="Noviembre"
    when "12"
        cadena_mes="Diciembre"
    end

    return cadena_mes
end

=begin cabecera_carta()
    Recibe una fecha y retona un string con el formato “Punta Alta, dd de mmmmmm de aaaa”.
    @ fecha : string con el formato dd/mm/aaaa.
    @ return : “Punta Alta, dd de mmmmmm de aaaa”
=end
def cabecera_carta(fecha)
    dia,mes,anio=descomponer_fechas(fecha)
    mes_nombre=mes_cad(mes)
    return "Punta Alta,"+dia+" de "+ mes_nombre+ " de "+anio

end

puts "Escriba un programa que permita ingresar una fecha válida 
y retorne la cadena “Punta Alta, dd de mmmmmm de aaaa”
(Donde mmmmmmm es el nombredel mes en letras)"
puts"----------------------------------------------------------"

puts"Ingrese una fecha"
fecha=ingresgar_fecha()

puts cabecera_carta(fecha)

final=gets.chomp