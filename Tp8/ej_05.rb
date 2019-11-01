puts "Determine el mayor sueldo ingresado para el ejercicio anterior"

arch=File.new("./Datos/datos_ej04.data","r")
max=0
arch.each do |linea|
  arry=linea.split(' ')

  if arry[1].to_i > max
    max=arry[1].to_i
  end
end

puts "El sueldo mas grande es: #{max}"