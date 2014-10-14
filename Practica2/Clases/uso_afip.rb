=begin


hacer un programa en otro archivo .rb que use estas clases.

=end

require './agenciarecaudadora.rb'

contribuyentes = Contribuyentes.new

5.times do | index |

	c = Contribuyente.new(
			nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s }
	)

	contribuyentes.addContribuyente(c)
end

puts "______________ contribuyentes_______\n"
puts contribuyentes.to_s
puts "_______________sin deuda_____________\n"
puts contribuyentes.sin_deuda.to_s
puts "_______________con deuda_____________\n"
puts contribuyentes.con_deuda_mayor_50_porciento

#intento agregar contribuyente repetido
puts "____agrego duplicados_______\n\n"

5.times do | index |

	c = Contribuyente.new(
			nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s }
	)

	p contribuyentes.addContribuyente(c)
end
puts "______________ contribuyentes_______\n"
puts contribuyentes.to_s


puts "_____________________________________\n"
(5..10).each do | index |

	c = Contribuyente.new(
			nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s },
			deuda: (100*index)
	)

	contribuyentes.addContribuyente(c)
end

puts contribuyentes.to_s

puts "_______________con deuda_____________\n"
puts contribuyentes.con_deuda_mayor_50_porciento

puts "________________________________________\n"

i = Impuesto.new(nombre = "impuesto auto ")
y = Impuesto.new(nombre = "impuesto bici")

block = lambda do |cont|
			if cont.deuda == 0
				(cont.ingresos.to_f * 5.00 /100.00).round(2)
			else 
				imp1 = cont.ingresos.to_f * 3.00 /100.00 + cont.deuda
				(imp1 * 120.00 /100.00).round(2)
			end
		end

y.calculo(&block)

c = contribuyentes.contribuyente('88888888888')
puts c
puts "monto a pagar por #{c.cuit} #{i.monto_a_pagar(c)}\n"
puts "monto a pagar por #{c.cuit} #{y.monto_a_pagar(c)}\n"
c = contribuyentes.contribuyente('11111111111')
puts c
puts "monto a pagar por #{c.cuit} #{i.monto_a_pagar(c)}\n"
puts "monto a pagar por #{c.cuit} #{y.monto_a_pagar(c)}\n"
