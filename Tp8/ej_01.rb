puts "Diseñe un programa que permita cargar un archivo con nombres de personas.
(El programa debe contemplar la posibilidad de que el archivo a utilizar exista 
y tenga elementos cargados)."

esta=File.exist?("./Datos/datos_ej01.data")
puts esta
if esta 
    arch=File.new("./Datos/datos_ej01.data","a")
else
    arch=File.new("./Datos/datos_ej01.data","w")
end

puts "Ingrese un nombre"
nom=gets.chomp

arch.puts(nom)

arch.close()



arch=File.new("./Datos/datos_ej01.data","r")

arch.each do |a|
    puts a
end