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

def busqueda_bin(arry,elem)
  
   return busq_bin(arry,0,arry.size,elem)
end

def busq_bin(arry,i,j,elem)
    pos=(i+j)/2
    if(arry[pos]==elem)
        return true
    else
        if((j-i)==1)
            return false
        else
            if(arry[pos]>elem)
                return busq_bin(arry,i,pos,elem)
            else
                return busq_bin(arry,pos,j,elem)
            end
        end
    end
end

a=[10,9,8,7,5,6,7,1,3]
b=ordenar(a)
puts b==a.sort()
puts b
puts busqueda_bin(b,13)
