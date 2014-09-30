=begin
class Alumno
 {:nombre =>  }
	def initialize(nombre, apellido, sexo, legajo)
		@nombre = nombre
		@apellido = apellido
		@sexo = sexo
		@legajo = legajo
		@asistencias = Hash.new
		#fecha => true,false
	end
	def agregarAsistencia()

end

class Catedra
	def initialize
		@alumnos = []		
	end
	def nuevoAlumno(nombre, apellido, sexo, legajo)
		a = Alumno.new(nombre, apellido, sexo, legajo)
		@alumnos << a
	end
	def porcentajeMujeresHombres()
		porH = 0
		@alumnos.each { |e| porH++ if e.sexo == "hombre" }
		puts "Cantidad hombres = #{porH} , cantidad mujeres = #{@alumnos.lenght - porH}"
	end
	def agregarAsistencia(legajo, fecha, asistencia)
		@alumnos.detect {|e| e.agregarAsistencia(fecha, asistencia) if e.legajo == legajo}
	end
end
=end

#1.b

#alumno0 = Hash.new {  }

alumno1 = {"nombre" => "juan", "apellido" => "suApellido", "sexo" => "H", "legajo"=> 12342, "asistencias" => [["12/12/2014",true],["13/12/2014",false],["14/12/2014",true]]}
alumno2 = {"nombre" => "juan", "apellido" => "suApellido", "sexo" => "M", "legajo"=> 12343, "asistencias" => [["12/12/2014",true],["13/12/2014",false],["14/12/2014",true]]}
alumno3 = {"nombre" => "juan", "apellido" => "suApellido", "sexo" => "M", "legajo"=> 12345, "asistencias" => [["12/12/2014",true],["13/12/2014",false],["14/12/2014",true]]}
catedra = [alumno1, alumno2, alumno3]

legajo = 12345
#busco un alumno por legajo y le agrego una asistencia
catedra.each {|al|  al.fetch("asistencias") << ["15/12/2014", true]if al.fetch("legajo") == legajo }
cantH = 0 
catedra.each {|al| 

	if al.fetch("sexo") == "H"
		cantH +=1
	end
 }  

puts "Porcentaje de hombres = #{cantH * catedra.size / 10.0 } cantidad de mujeres = #{(catedra.size - cantH) * catedra.size / 10.0 }"



