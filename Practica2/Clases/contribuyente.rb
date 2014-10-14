=begin
Crear una clase Contribuyente que tenga los siguientes atributos (todos deben tener accesors):

nombre
apellido
cuit
deuda
ingresos

En caso de no especificarse deuda al instanciar el Contribuyente la misma será 0 
y en caso de no especificar ingresos se deberá asumir que gana el salario mínimo.

=end

class Contribuyente
	@@tipos_salarios = {"salario minimo" => 1000 }
	include Comparable
	attr_accessor :nombre, :apellido, :cuit, :deuda, :ingresos

	def initialize (**args)
		@nombre = args[:nombre]
		@apellido = args[:apellido]
		@cuit = args[:cuit]
		@deuda = args.key?(:deuda)? args[:deuda] : 0
		@ingresos = args.key?(:ingresos)? args[:ingresos] :  @@tipos_salarios["salario minimo"]
	end

	def <=>(other)
		self.ingresos <=> other.ingresos
	end

	def to_s 
		"nombre: "+self.nombre.to_s+" apellido: "+self.apellido.to_s+" cuit:" +self.cuit.to_s+ " deuda: "+self.deuda.to_s+" ingresos:"+self.ingresos.to_s+"\n"
	end

end
