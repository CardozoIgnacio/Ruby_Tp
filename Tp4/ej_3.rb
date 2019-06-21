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
    valido=false
    if ((01..31)===dia.to_i)
    if((01..12)===mes.to_i)&&es_valido(mes,dia)||(mes=="02"&&dia=="29")&& es_bisiesto(anio.to_i)
            if ((1..9999)===anio.to_i)
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

=begin fecha_mas_antigua(fecha1,fecha2)
    Dado dos fechas validas calcula si la fecha1 es la mas actual
=end
def fecha1_mas_antigua(fecha1,fecha2)
    d1,m1,a1=descomponer_fechas(fecha1)
    d2,m2,a2=descomponer_fechas(fecha2)
    if(a1.to_i>a2.to_i)
        return true
    else
        if(a1.to_i==a2.to_i)
            if(m1.to_i>m2.to_i)
                return true
            else
                if(m1.to_i==m2.to_i)
                    if(d1.to_i>d2.to_i)
                        return true
                    else
                        if(d1.to_i==d2.to_i)
                            return false
                        else
                            return true
                        end
                    end
                else
                    return false
                end 
            end
        else
            return false
        end
    end
end
=begin edad(fecha,fechaFinal)
    Dada la fecha actual y una fecha de cumple anios calcula la edade de una persona.Se asume que las fechas ingresadas seran fechas validas(Validadas antes de llamar a esta def)..
    @ fecha : fecha actual .
    @ fechaFinal : fecha de cumpleanio.
    return edad de una persona .

    WARNING : Limitacion de computo de este metodo no es eficiente hacer recursion con asignacion dinamica, no calcula mas de 10 años hacia atras contando desde la fecha actual.
    Solucion : Metodo iterativo realizado.

=end
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

=begin edad_iter(fecha,fechaFinal)
    Dada la fecha actual y una fecha de cumple anios calcula la edade de una persona.Se asume que las fechas ingresadas seran fechas validas(Validadas antes de llamar a esta def).
    Imprime por pantalla los Anio, meses y dias de vida.
    @ fecha : fecha actual .
    @ fechaFinal : fecha de cumpleanio.
=end
def edad_iter(fecha,fechaFinal)
       dia=0
       mes=0
       anio=0
       dia_c,mes_c,anio_c=descomponer_fechas(fecha)
       begin
              d,m,a=descomponer_fechas(fecha)
              fecha_aux=dia_sig(d)+"/"+m+"/"+a
              dia=dia+1
              if(fecha_valida(fecha_aux))
                     fecha=fecha_aux
                     if(d==dia_c&&mes_c!=m)
                         dia=0
                         mes=mes+1
                     end
              else
                     fecha_aux="01"+"/"+mes_sig(m)+"/"+a
					 if(dia_c=="29"||dia_c=="30"||dia_c=="31")&&dia>=28
						 dia=0
                         mes=mes+1
					 end
                     if(fecha_valida(fecha_aux))
                            fecha=fecha_aux                         
                     else
                            fecha="01"+"/"+"01"+"/"+(a.to_i+1).to_s                   
                     end
                    
              end
              d,m,a=descomponer_fechas(fecha)
              if(d==dia_c&&mes_c==m)||(dia_c=="29"&&mes_c=="02"&&d=="28"&&m=="02")&&!es_bisiesto(a.to_i)
              
                anio=anio+1
				mes=0
				dia=0		
              end
             
       end until(fecha==fechaFinal)
       puts "Cantidad de dias #{dia}"
       puts "Cantidad de meses #{mes}"
       puts "Cantidad de años #{anio}"

end
#main
puts "Idem al anterior pero ingresar una fecha válida y tomar la fecha de la PC, 
       y determinar la edad de esa persona en formato años, meses y días"
puts"-------------------------------------------------------------------------"

t = Time.now
 
dia_a= t.strftime("%d")
mes_a= t.strftime("%m")
anio_a= t.strftime("%Y")

anio_a= dia_a+"/" +mes_a +"/"+anio_a

begin
    puts "Ingrese la fecha de nacimiento"
    anio_n=ingresgar_fecha()
end until fecha1_mas_antigua(anio_a,anio_n)

edad_iter(anio_n,anio_a)


final=gets.chomp