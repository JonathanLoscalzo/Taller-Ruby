=begin

Se debe implementar un método leer, que dado un nombre de archivo lo lea y retorne 
un string con su contenido. En caso que el archivo no exista debe crearlo y retornar un string vacío.

Por ejemplo:

> leer '/etc/issue'
=> "Lihuen 5.10 5.10 GNU/Linux \\n \\l\n"
> leer 'sdcassdasd'
=> ""

Implemente 2 versiones del método anteriormente descripto, una usando manejo de excepciones y otra sin usar manejo de excepciones.

=end

def leer_sin(filename)
	if File.exist? filename
		f = File.open(filename,'r').each do |l|
			puts l 
		end
		f.close()		
	else
		puts "No existe el archivo"	
		File.open(filename, 'w').close()
	end
	
end


def leer_con(filename)
	begin
		 f = File.open(filename, 'r').each do |l|
			puts l 
		end
		f.close()
	rescue Exception 
		STDERR.puts "Fallo al abrir #{filename}: #{$!}"
		File.open(filename, 'w').close()
	ensure
		
	end
end
