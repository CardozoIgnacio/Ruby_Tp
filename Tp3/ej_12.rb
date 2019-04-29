#modulos
def control_A(cadena)
    i=0
    begin
        if (cadena[i]>="a"&&cadena[i]<="z")||(cadena[i]>="A"&&cadena[i]<="Z")
            i=i+1
        else
            return false
        end
    end until(i==cadena.length)
    return true
end
def control_E(email)
    if(email[0]==".")
        return false
    else
        i=0
        cantA=0
        cantP=0
        begin
            if(email[i]=="@")
                cantA=cantA+1
            end
            if(email[i]==".")
                cantP=cantP+1
            end
            i=i+1
        end until(i==email.length)
        if(cantA==1&&cantP==1)
            return true
        else
            return false
        end
    end
end
def control_D(direccion)
    i=0
    begin
        if(direccion[i]>="a"&&direccion[i]<="z")||(direccion[i]>="A"&&direccion[i]<="Z")||(direccion[i]>="0"&&direccion[i]<="9")
            i=i+1
        else
            return false
        end
        
    end until(i==direccion.length)
    return true
end
def control_I(importe)
    cad_num=importe.to_s
    punto=0
    i=0
    begin
        if(cad_num[i]>="0"&&cad_num[i]<="9")
            i=i+1
        else
            if(cad_num[i]=="."&&punto==0)
                punto=punto+1
                i=i+1
            else
                return false
            end
        end
    end until(i==cad_num.length)
    return true
end
def control_F(fecha)
    if fecha.length!=10
        return false
    else 
        if (fecha[2]=="/"&& fecha[5]="/")||(fecha[2]=="-"&&fecha[5]=="-")
            dia=fecha[0]+fecha[1]
            mes=fecha[3]+fecha[4]
            anio=fecha[6]+fecha[7]+fecha[8]+fecha[9]
            return fecha(dia,mes,anio)
        else
            return false
        end
    end
end
#dd/mm/aaaa
def fecha(dia,mes,anio)
    if ((01..31)===dia.to_i)
        if((01..12)===mes.to_i )&& es_valido(mes,dia)
            if ((1900..2019)===anio.to_i)
                return true
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
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
def ingreso(letra,dato)
    if (letra=="A")
        return control_A(dato)
    end
    if (letra=="E")
        return control_E(dato)
    end
    if (letra=="D")
        return control_D(dato)
    end
    if (letra=="I")
        return control_I(dato)
    end
    if (letra=="F")
        return control_F(dato)
    end    
end 
def controlar_op(operacion)
    if (operacion=="A"||operacion=="E"||operacion=="D"||operacion=="I"||operacion=="F")
        return true
    else
        return false
    end
end
def ingreso_dato()
    puts "Seleccione dato a ingresar"
    puts " 
    >El dato identificado con “A” es un apellido.
    >El dato identificado con “E” es un e-mail.
    >El dato identificado con “D” .
    >El dato identificado con “I”es un importe.
    >El dato identificado como fecha “F“ formato dd/mm/aaaa."
    operacion=gets.chomp
    if controlar_op(operacion)
        puts "Ingrese el dato asociado a la operacion"
        dato=gets.chomp
        if ingreso(operacion,dato)
            puts "Dato ingresado es correcto"
        else
            puts "Datos ingresado no cumple con los parametros establecidos, por favor vuela a ingresar"
            return ingreso_dato()
        end
    else
        puts "Operacion seleccionada no valida,por favor vuelva a ingresar"
        return ingreso_dato()
    end

end
#main
=begin
puts"Consigna"
puts "Escriba un programa que permita ingresar distintos datos. Cada dato tiene sus restricciones.
 Si el dato ingresado no cumple con las restricciones luego de validarlo, se debe volver a ingresar.
 La rutina (def) debe llamarse ingreso, y se le pasa una letra como parámetroque indica el tipo de información que se va a ingresar:
 El dato identificado con “A” es un apellido, y no debe contener guiones ni dígitos numéricos.
 El dato identificado con “E” es un e-mail, y debe contener 1 y solo 1 símbolo arrobay por lo menos un punto pero no al inicio.
 El dato identificado con “D” es una domicilio y puede contener de todo excepto símbolos,signos de puntuación, admiracióno exclamación.
 El dato identificado con “I”es un importe, y sólo acepta dígitos numéricos y ocasionalmente un solo punto decimal.
 El dato identificado como fecha debe contener dígitos numéricos y debe respetar un formato dd/mm/aaaa.
 A veces las barras pueden reemplazarse con “-“. Debe controlar que los días pertenezcan a meses válidos."
=end
ingreso_dato()
 final=gets.chomp