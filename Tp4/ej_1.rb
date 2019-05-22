def fecha_valida(fecha)
    if fecha.length!=10
        return false
    else 
        if (fecha[2]=="/"&& fecha[5]="/")||(fecha[2]=="-"&&fecha[5]=="-")
            dia=fecha[0]+fecha[1]
            mes=fecha[3]+fecha[4]
            anio=fecha[6]+fecha[7]+fecha[8]+fecha[9]
            return control_F(dia,mes,anio)
        else
            return false
        end
    end
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

#main
puts "Escriba  un  programa  que  permita  ingresar  una  fecha  en  formato  completo  (dd/mm/aaaa) 
      como  String y devuelva  TRUE  si  es  una  f válida  o  FALSE  si no  lo  es.  Tenga  en  cuenta  
      todas  las  posibilidades  que  puedan existir.Los separados pueden ser tanto “/”como “-“."
puts "Ingrese un fecha"
fecha=gets.chomp

if fecha_valida(fecha)
    puts "Es una fecha valida"
else
    puts "No es una fecha valida"

final=gets.chomp