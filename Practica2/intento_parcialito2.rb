=begin

La cátedra quiere manejar información de los alumnos que cursan la materia.
De cada alumno se quiere guardar la siguiente información:
* Nombre
* Apellido
* Sexo
* Legajo
* Parciales: una lista con la fecha del parcial y la nota obtenida
asumo que se toma un parcial por dia.

1) Modelá usando array y hashes
a) Explicá cómo se guarda cada “entidad”
b) Mostrá un ejemplo de instanciación de un alumno
c) Buscá un alumno y agrégale un parcial

2) Obtené las siguientes estadísticas:
a) Porcentaje de hombres y mujeres
b) 5 mejores promedios
c) 5 peores promedios

=end
require 'date'
#__________________INICIALIZACION DE ESTRUCTURAS_____________________
# parciales son hash con key en fechas.
@parciales = {
	Date.new(2014,12,12).to_s => 3,
  	Date.new(2014,12,13).to_s => 4,
  	Date.new(2014,12,14).to_s => 3,
  	Date.new(2014,12,15).to_s => 6,
  	Date.new(2014,12,16).to_s => 7
}

# Cada alumno es una hash. 
@alumno = {}
@alumno[:nombre] = nil
@alumno[:apellido] = nil
@alumno[:sexo] = nil
@alumno[:legajo] =nil
@alumno[:parciales] = nil # los parciales son un hash con fecha key.

@catedra = [] # arreglo de alumnos

#inicializo la estructura, agrego 5 alumnos

def crear_alumno(id, sexo)
	a = @alumno.dup
	a[:nombre] = "nombre-"<<id.to_s
	a[:apellido] = "apellido-"<<id.to_s
	a[:sexo] = sexo
	a[:legajo] = id
	a[:parciales] = @parciales.dup
	a
end


5.times.each do |index|
	@catedra << crear_alumno(index, "H")
end

(5..10).each do |index|
	@catedra << crear_alumno(index, "M")
end

# _________________________________________________

#agregar un alumno se hace como en el anterior. Agrego varios alumnos
#para poder realizar las cuentas.

#_________________________________________________

def agregar_fecha(id, fecha = Date.today.to_s, nota)
	#de esta manera solo meto la fecha 
	a = buscar_alumno(id)
	a[:parciales].merge!( fecha => nota )
end

def buscar_alumno(id)
	a = @catedra.detect { |alum| alum[:legajo] == id }
end

def to_s_alumno(id)
	
	a = buscar_alumno(id)
	s = ""
	s << a[:nombre] << "\n" 
	s << a[:apellido] << "\n" 
	s << a[:sexo] << "\n" 
	s << a[:legajo].to_s << "\n" 
	s << a[:parciales].to_s << "\n"

end

id = 5
fecha = Date.new(2014,01,01).to_s
nota = 9

puts to_s_alumno(id) 
agregar_fecha(id, fecha, nota)
puts to_s_alumno(id)

puts "\n\n _____________________ \n\n"



#_------------------------------------------------
# % de hombre y mujeres.

def porcentaje_sexo(sexo)
	cant = @catedra.size
	elem = @catedra.select {|elem| elem[:sexo] == sexo }.size
	(( elem * 100.0 )/cant).round(2)
end

def porcentaje_hombres()
	porcentaje_sexo("H")
end


def porcentaje_mujeres()
	porcentaje_sexo("M")
end


puts porcentaje_mujeres.to_s << " % de mujeres y " << porcentaje_hombres.to_s << "% de hombres."


# ______________________________________
puts "____________________________________________\n"

def promedio_hash(hashPromedios)
	hashPromedios.inject(0) { |acum, (k,v)| acum + v }.to_f / hashPromedios.size
end

def ordenar_por_promedios()
	@catedra.sort do |a,b|
		promedio_hash(b[:parciales]) <=> promedio_hash(a[:parciales])
	end
end

def mejores_promedios()
	ordenar_por_promedios.first(5)
end

def peores_promedios
	ordenar_por_promedios.reverse.first(5)
end
agregar_fecha(id=6, nota= 8)
agregar_fecha(id=8, nota= 7)
agregar_fecha(id=3, nota= 10)
agregar_fecha(id=9, nota= 10)



puts ordenar_por_promedios.to_s + "\n"
puts "\n____________________________________________\n"

puts mejores_promedios.to_s + "\n"
puts "\n____________________________________________\n"

puts peores_promedios.to_s+ "\n"




#_______________________________________


