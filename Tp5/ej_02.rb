def diferencia(a,b)
    c=Array.new()
    i=0
    begin
        if !esta(a[i],b)
            c[c.size]=a[i]
        end
        i=i+1
    end until(a.size==i)
    return c
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
def union(a,b)
    c=Array.new
    i=0
    a=a+b
    begin
        if(!esta(a[i],c))
            c[c.size]=a[i]
        end
        i=i+1
    end until(a.size==i)
    return c
end
#main
op_sys = ["Fedora", "SuSE", "Tuquito", "Windows", "MacOS"]
linux_sys = ["Tuquito", "SuSE", "PCLinuxOS", "Ubuntu", "Fedora"]
puts "Diferencia"
puts (op_sys-linux_sys)==diferencia(op_sys,linux_sys)
puts "Interseccion"
puts (op_sys & linux_sys)==interseccion(op_sys,linux_sys)
puts "Union"
puts (op_sys | linux_sys)==union(op_sys,linux_sys)
final=gets.chomp