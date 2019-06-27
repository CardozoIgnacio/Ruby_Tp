def concatenar(a,b)
    c=Array.new()
    c=a+b
    return c
end

def concatenarIter(a,b)
   c=Array.new
   c=a
   i=0
   begin
    puts c.size

    c[c.size]=b[i]
    i=i+1
   end until(i==b.length)
   return c
end

#main
a = ["Lunes", "Martes", "Miércoles"]
b = ["Jueves", "Viernes", "Sábado", "Domingo"]


c=concatenarIter(a,b)
puts c

final=gets.chomp