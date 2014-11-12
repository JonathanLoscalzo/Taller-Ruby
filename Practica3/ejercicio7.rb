
=begin
Implemente un programa de consola interactivo que permita enviar 
las instrucciones disponibles a c3po y a r2d2 
eligiendo desde un menú quién será el destinatario de la acción.

Ante una excepción el programa debe capturarla y mostrar un mensaje para el usuario indicando el error. 
el programa debe seguir funcionando.

http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop

=end

=begin
class ShellUI
	private
		extend CLI::Task

	public
		usage 'Usage: ls'
		desc 'List file information about current directory'
		def ls(params)
			Dir.foreach(Dir.pwd) do |file|
				puts file
			end
		end

		usage 'Usage: pwd'
		desc 'Display current directory'

		def pwd(params)
			puts "Current directory: #{Dir.pwd}"
		end

		usage 'Usage: cd <Directory>'
		desc 'Change current directory'

		def cd(params)
			Dir.chdir(params[0]) unless params.empty?
		end
end


http://www.rubydoc.info/gems/cli-console/0.1.4/CLI/Task

=end
require 'highline'
require 'cli-console'

require_relative 'ejercicio6'

class RobotsUI
	private
	extend CLI::Task
	
	public

	def initialize()
		
		self.imprimir_mensaje %Q[Selecciona r2d2 o c3po como robots (son comandos)\n
			Cuando seleccionas uno, se guarda en robot1\n
			cuando seleccionas el segundo, en el segundo y se ataca automaticamente.\n
			Despues harè para que sea un poco màs interactiva.\n]
		
		@r2d2 = Robot.new
		@c3po = Robot.new
		@robot1 = nil
		@robot2 = nil
		@accion = :atacar
	end

	usage 'Usage: c3po '
	desc 'Usar el robot c3po'

	def c3po(params)
		if @robot1 == nil
			@robot1 = @c3po
			self.imprimir_mensaje %Q[ c3po guardado en robot1]
		else
			@robot2 = @c3po
			self.imprimir_mensaje %Q[ c3po guardado en robot2 y atacar!!!! ]
			self.realizar_ataque
		end

	end

	usage 'Usage: r2d2 '
	desc 'Usar el robot c3po'

	def r2d2(params)
		if @robot1 == nil
			self.imprimir_mensaje %Q[ r2d2 guardado en robot1]

			@robot1 = @r2d2
		else
			@robot2 = @r2d2
			self.imprimir_mensaje %Q[ r2d2 guardado en robot2 y atacar!!!! ]
			self.realizar_ataque
		end	
	end

	def realizar_ataque
		begin
			@robot1.send @accion, @robot2 
		rescue Exception => e
			self.imprimir_mensaje e
		ensure
			@robot1 = nil
			@robot2 = nil
		end
	end

	def imprimir_mensaje(string)
		@a = %Q!
		=====================================================================================

			#{ string }

		=====================================================================================!
		puts @a
	end


end



	io = HighLine.new
	#shell = ShellUI.new
	shell = RobotsUI.new

	console = CLI::Console.new(io) #inicio una nueva consola
	#le agrego los metodos de mi clase

	console.addCommand('r2d2', shell.method(:r2d2), 'Seleccionar r2d2')
	console.addCommand('c3po', shell.method(:c3po), 'Seleccionar c3po')

	#leagrego unos por defecto
	console.addHelpCommand('help', 'Help')
	console.addExitCommand('exit', 'Exit from program')
	console.addAlias('quit', 'exit')

	#inicio la consola
	console.start("%s> ",[Dir.method(:pwd)])

