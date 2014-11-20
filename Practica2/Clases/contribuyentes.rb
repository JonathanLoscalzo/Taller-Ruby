=begin
Crear una clase Contribuyentes, la misma deberá ser una colección de objetos 
Contribuyente que permita realizar las siguientes acciones:

Agregar un Contribuyente a la colección (verificar que no haya cuits duplicados).
Obtener un listado de los contribuyentes que tengan una deuda del 50% o más de sus ingresos.
Obtener un listado de los contribuyentes sin deuda.
La clase Contribuyentes deberá incorporar los comportamientos de Enumerable.
max, min y sort deberán operar en base a los ingresos del Contribuyente.

=end
#require './contribuyente'
#require_relative 'contribuyente'

# podria ser un singleton.

class Contribuyentes
	include Enumerable	
	attr_reader :arr_contr # => esto es para que aparezca oculto la variable?.
	def initialize
		@arr_contr = []
	end

	def each
		#IMPORTANTE. YIELD ES EL QUE SE RECIBE.
		@arr_contr.each {| e | yield e }
	end

	def include?(cuit)
		self.collect { | e | e.cuit } . include? cuit
	end

	def contribuyente(cuit)
		if (self.include? cuit)
			self.detect { | e | e.cuit == cuit}
		end
	end

	def addContribuyente(contribuyente)
		unless (self.include? contribuyente.cuit)
			@arr_contr << contribuyente
		else
			#, "contribuyente con cuit #{contribuyente.cuit} duplicado"
			raise Exception
		end
	end

	def con_deuda_mayor_50_porciento
		self.select { |c| ( c.deuda / c.ingresos.to_f ) >= 0.5 }
	end

	def sin_deuda
		elems = self.select { | c | c.deuda == 0}
		c = Contribuyentes.new
		elems.each { | e | c.addContribuyente e}
		c
	end

	def to_s
		self.inject("") { | acum, e | acum << e.to_s }
	end

	private :arr_contr
end
