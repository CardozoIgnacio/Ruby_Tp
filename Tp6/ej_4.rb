puts "Cree un hash de 100 elementos con la serie de Fibonacci 
(ver t.p.1º año)en donde la clave es el orden (desde 0) y el 
valor es el obtenido por Fibonacci. "

fibo = Hash.new()
i=1
fibo[0]=0
fibo[1]=1
begin
    i=i+1
    fibo[i]=fibo[i-1]+fibo[i-2]
end until (i==100)

puts fibo

