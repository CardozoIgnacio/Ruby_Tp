def sin_duplicados(vec)
    aux=Array.new
    i=0
    begin
        if !esta(vec[i],aux)
            aux[aux.size]=vec[i]
        end
        i=i+1
    end until(i==vec.size)
    return aux
end
def generar_vector()
    vec=Array.new()
    begin
        vec[vec.size]=rand(-999..-1)
    end until(vec.size==100)
    return vec
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
#main
vector=generar_vector()
vector=sin_duplicados(vector)
puts vector.uniq==vector

final=gets.chomp