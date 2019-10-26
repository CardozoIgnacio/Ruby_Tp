puts "Una empresa trabaja con 4 tasas diferentes de IVA. Las mismas son: 0%, 10.5%, 21% y 27%.
 Escriba un programa que permita el ingreso de 30 importes (puede ser al azar) y para cada uno 
 de ellos indíqueles al azar el tipo de tasa IVA que le corresponde. Quite el IVA de cada 
 importe (según la tasa) y acumúlelo en un hash cuyo índice sea la tasa. Muestre el Hash
  resultante. (Debe combinar arrayscon el hash final)"

  importe= Hash.new()
  importe[0]=Array.new()
  importe[10.5]=Array.new()
  importe[21]=Array.new()
  importe[27]=Array.new()
  iva=Hash.new()
  iva[0]=0
  iva[1]=10.5
  iva[2]=21
  iva[3]=27
    i=0
  begin
    venta=rand(0..9000)
    venta_iva=rand(0..3) 
    importe[iva[venta_iva]].push(venta-(venta*(iva[venta_iva]/100)))
    i=i+1
  end until(i==30)

  puts importe
  