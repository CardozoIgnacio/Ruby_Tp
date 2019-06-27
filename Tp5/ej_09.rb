def nombre()
    print "Ingrese un nombre"
    nomb=gets.chomp
   
       
    
end

def valido(nomb)
    i=0
    if nomb.length==0  
        return false
    end
    val=true
    begin
        if !((97..122)===nomb[i]||(65..90)===nomb[i])
            val=false
        end
        i=i+1
    end until(i==nomb.size|| val==false)
    return val
end

def pedir_nom(veces)
    arry=Array.new
    begin
        arry[arry.size]=nombre()
       
    end until(arry.size==veces)
    return arry
end

def nomb_may(nom)
    i=0
    aux=""
    begin
        aux[i]=mayus(nom[i])
        i=i+1
    end until(nom.length==i)
    return aux
end

def mayus(char)
    char=char.ord
    if(97..122)===char
        char=(char-32).chr
    else
        char=char.chr
    end
    return char

end

def invertir_nom(nom)
    aux=""
    i=nom.size-1
    begin
        aux[aux.size]=nom[i]
        i=i-1
    end until(aux.size==nom.size)
    return aux
end

def nombre_may(arry)
    i=0
    aux=Array.new()
    begin
        aux[i]=nomb_may(arry[i])
        i=i+1
    end until(arry.size==i)
    return aux
end

def nomb_inv(arry)
    i=0
    begin
        arry[i]=invertir_nom(arry[i])
        i=i+1
    end until(arry.size==i)
    return arry
end
#main

arry=pedir_nom(2)
print arry
a1= nombre_may(arry)
print a1
a2=nomb_inv(arry)
print a2

