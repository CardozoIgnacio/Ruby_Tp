def generar_notas()
    vec=Array.new()
    cant= 10
    begin
        vec[vec.size]=rand(0..10)
    end until(vec.size==cant)
    return vec
end

def res_prom(arry)
    i=0
    aux=Array.new()
    begin
        aux[aux.size]=(arry[i]+arry[(arry.size-1)-i])/2.0
        i=i+1
    end until(i==5)
    return aux
end
def mod(cad)
    return cad[0]="c"
end
#main

cad="hola"
sol =mod(cad)

print cad
