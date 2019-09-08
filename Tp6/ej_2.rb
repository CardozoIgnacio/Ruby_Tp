puts"Se tienen 2 arraysde 11 elementos. Uno contiene los números de camiseta 
de un equipo de rugby (no repetidos) y otro los nombres de los jugadores. 
Cree un hash asociando ambos arrays. Además disponga una función que reciba 
un string separado por guiones P/ej: (1-3-11-7-15-22-4-7) 
e informe los nombres de esos jugadores, también separados por guiones."

camisetas=[1,2,3,4,5,6]
jugadores=["A","B","C","D","E","F"]

camiseta_jugador=Hash.new()

i=0
begin
    camiseta_jugador[camisetas[i]]=jugadores[i]
    i=i+1
end until(jugadores.size==i)

puts "Ingrese jugadores"
player=gets.chomp
arry_player=player.split("-")

i=0
begin
    if (camiseta_jugador.has_key?(arry_player[i].to_i))
        print camiseta_jugador[arry_player[i].to_i],"-"
    end
    i=i+1
end  until(i==arry_player.size)