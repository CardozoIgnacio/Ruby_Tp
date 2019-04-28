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

#main
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

 cadena=gets.chomp
 puts control_I(cadena)

 final=gets.chomp