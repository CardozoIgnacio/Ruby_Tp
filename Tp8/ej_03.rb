puts "Cree otro un nuevo archivo con nombres de personas similar al punto 1.
 Luego genere un nuevo archivo que contenga la información de ambos archivos 
 mezclados, es decir, un dato del 1o, 1 dato del 2o, luego un dato del 1o, 
 luego un dato del 2o y así sucesivamente hasta completar la totalidad de
registros que se encuentren. (Tenga en cuenta que un archivo puede finalizar antes que otro)."

arch=File.new("./Datos/datos_ej03.data","w")

arch.puts("Hernesto")
arch.puts("Abelardo")
arch.puts("Damian")
arch.puts("Agustin")

arch.close

arch1=File.new("./Datos/datos_ej01.data","r")
arch2=File.new("./Datos/datos_ej03.data","r")
arch3=File.new("./Datos/datos_ej03_combinado.data","w")

begin
    ele1=arch1.read()
    ele2=arch2.read()
    arch3.puts(ele1)
    arch3.puts(ele2)
end until arch2.eof() || arch1.eof()

if (!arch2.eof())
    arch2.each do |renglon|
        arch3.puts(renglon)
    end
end

if (!arch1.eof())
    arch1.each do |renglon|
        arch3.puts(renglon)
    end
end