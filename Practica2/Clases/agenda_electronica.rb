=begin

Se quiere administrar una agenda electrónica. De cada contacto necesita guardarse:

Nombre
Fecha de nacimiento
Email
Teléfono
Dirección
Se quiere hacer una aplicación de línea de comandos que permita:

Ver todos los contactos
Agregar un contacto
Editar un contacto
Buscar un contacto
Los datos deben ser guardados en un archivo CSV.

=end

#=========================================================================================================


class CSV_reader
	require 'csv'
	def initialize
		
	end

	def contenido(nombre_archivo)
		@contenido = []
		CSV.foreach(nombre_archivo) do |row|
			puts row
			#@contenido << Contacto.new(**row)
		end
		@contenido
	end

	def guardar(nombre_archivo, contenido)

	end
end

#=========================================================================================================


class Contacto

	attr_accessor :nombre, :fecha_nacimiento, :email, :telefono, :direccion	
	def initialize(**args)
		@nombre = args.key?(:nombre)? args[:nombre] : "" #deberia tirar excepcion.
		@fecha_nacimiento = args.key?(:fecha_nacimiento)? args[:fecha_nacimiento] : ""
		@email = args.key?(:email)? args[:email] : ""
		@telefono = args.key?(:telefono)? args[:telefono] : ""
		@direccion = args.key?(:direccion)? args[:direccion] : ""
	end

	def edit(**args)
		@nombre = args.key?(:nombre)? args[:nombre] : @nombre #deberia tirar excepcion.
		@fecha_nacimiento = args.key?(:fecha_nacimiento)? args[:fecha_nacimiento] : @fecha_nacimiento
		@email = args.key?(:email)? args[:email] : @email
		@telefono = args.key?(:telefono)? args[:telefono] : @telefono
		@direccion = args.key?(:direccion)? args[:direccion] : @direccion
		self
	end

	def to_s
		"nombre:#{nombre}, fecha nacimiento #{fecha_nacimiento}, email: #{email}, telefono: #{telefono}, direccion: #{direccion} \n"
	end
end
#=========================================================================================================
#nose si hay un metodo que haga esto. Me parece que si.
class Array
	def array_to_hash
		Hash[(0...self.size).zip self]
	end
end

#=========================================================================================================

class Agenda
	
	def initialize(nombre_archivo = "")
		@contenido = []
		@nombre_archivo = nombre_archivo
	end

	def add_contacto(**contacto)
		#inyeccion de dependencias?. Probar si anda esto.
		@contenido << Contacto.new(**contacto)
	end

	def edit_contacto(key, **args)
		contacto = self.search_contacto(key)
		unless contacto.nil?
			contacto.edit(**args)
		else
			"Contacto numero #{key} no existe"	
		end

	end

	def search_contacto(key)
		@contenido[key]
	end
	

	def list_contactos
		#se podra hacer con un inject?
		s = ""
		@contenido.array_to_hash.each do | k,v |
			s << "#{k})- #{v.to_s}"
		end
		s
	end

	def cargar_archivo(nombre_archivo)
		#@contenido = @reader.contenido(nombre_archivo)
	end

	def guardar_archivo()

	end
end

#=========================================================================================================
#pruebas.Falta uno que lea desde el cli.

require 'date'
agenda = Agenda.new
5.times.each do | index |
	agenda.add_contacto(
		nombre: "nombre-#{index}",
		fecha_nacimiento: Date.today.to_s,
		email: "email-#{index}@ejemplo.com",
		telefono: index.to_s * 10,
		direccion: "mi dire #{index.to_s * 4}"
	)
end

puts agenda.list_contactos

puts agenda.edit_contacto(10, 
		nombre: "nombre-nuevo",
		email: "mi_nuevo_email@ejemplo.com",
)

puts agenda.edit_contacto(3, 
		nombre: "nombre-nuevo",
		email: "mi_nuevo_email@ejemplo.com",
)
puts agenda.list_contactos


#=========================================================================================================


