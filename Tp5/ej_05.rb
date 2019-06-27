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
#main
a=[10,9,8,7,5,6,7,1,3]
b=ordenar(a)
puts b==a.sort()
puts b