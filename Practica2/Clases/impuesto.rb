=begin

Crear una clase Impuesto, los objetos Impuesto deberán tener como atributo 
el nombre del impuesto y proveer los métodos:

Impuesto#monto_a_pagar(contribuyente) retorna el monto a pagar por el contribuyente dado.
Impuesto#calculo(&bloque) usa el bloque dado para calcular el monto a pagar en futuras invocaciones 
del método Impuesto#monto_a_pagar.

Al instanciar un Impuesto se asume que el monto a pagar será el 3% de los ingresos y 
si el Contribuyente tiene deuda se sumará la deuda más un 15% sobre el total.

=end

class Impuesto
	attr_accessor :nombre, :bloque

	def initialize(nombre)
		@nombre = nombre
		@bloque = lambda do |cont|
			if cont.deuda == 0
				(cont.ingresos.to_f * 3.00 /100.00).round(2)
			else 
				imp1 = cont.ingresos.to_f * 3 /100.00 + cont.deuda
				(imp1 * 115.00 /100.00).round(2)
			end
		end
	end

	def monto_a_pagar(contribuyente)
		@bloque.call contribuyente
	end

	def calculo(&bloque)
		@bloque = bloque
	end
end

 