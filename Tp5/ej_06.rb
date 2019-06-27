def generar_vector()
    vec=Array.new()
    cant= rand(0..100)
    begin
        vec[vec.size]=rand(0..500)
    end until(vec.size==cant)
    return vec
end
def ordenar(arry)
    if(arry.size==0)||(arry.size==1)
        return arry
    else
        i=0
        begin
           j=i
           begin

            if(arry[i]>arry[j])
                aux=arry[j]
                arry[j]=arry[i]
                arry[i]=aux
            end
            j=j+1
           end until(j==arry.size)
            
           i=i+1
        end until(i==arry.size)
        return arry
    end
end
def esta(elem,arry)
    i=0
    enc=false
    if arry.size==0 

        return false 
    end
    begin
        if(arry[i]==elem)
            enc=true
        end
        i=i+1
    end until(arry.size==i||enc)
    return enc
end
def interseccion(a,b)
    c=Array.new
    i=0
    begin
        if(esta(a[i],b))
            c[c.size]=a[i]
        end
        i=i+1
    end until(a.size==i)
    return c
end
#main

a= generar_vector()
b= generar_vector()

a_ord=ordenar(a)
b_ord=ordenar(b)


puts  interseccion(a_ord,b_ord)
