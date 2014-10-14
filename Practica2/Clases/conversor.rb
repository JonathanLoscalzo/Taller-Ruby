=begin

Se quiere hacer un conversor de medidas:

De pies a metros
De metros a pies
Donde m = ft / 3.2808 (m = meters, ft = feets)

¿Que alternativas tenemos para implementar la solución? ¿Cuál considerás mejor? ¡Implementala!

=end

#============================================================================
#esto es con metodos de instancia. Con una clase que almacena valores ( como Money )

class Unidades
	@valor = nil
	def initialize(valor)
		@valor = valor
	end

	def metros
		"deberia estar implementado"
	end

	def pies
		"deberia estar implementado"
	end
end


class Metros < Unidades
	def pies
		@valor / 3.2808
	end

	def metros
		@valor	
	end
end

class Pies < Unidades

	def metros
		@valor * 3.2808
	end

	def pies
		@valor
	end
end

#============================================================================