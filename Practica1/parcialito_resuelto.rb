=begin
La catedra quiere manejar informacion de los alumnos que cursan la materia
de cada alumno sequiere guardar la siguiente informacion
nombre
aṕellido
sexo
legajo
asistencias

1. Modela usando arrays y hashes
a explica como se guarda cada entidad
b) mostra un ejemplo de instanciacion de un alumno
c) busca un alumno y agregale una asistencia

2.Obtene las siguientes estadisticas
a)porcentaje de hombres y mujeres
b)5 alumnos con más presencias
c)5 alumnos con menos presencias  
  
=end

require 'date'
alumno = Hash.new
alumno[:nombre] = nil
alumno[:apellido] = nil
alumno[:sexo] = nil
alumno[:legajo] = nil
alumno[:asistencias] = []

catedra = []
asistencia  = \
{
  Date.new(2014,12,12).to_s => true,
  Date.new(2014,12,13).to_s => true,
  Date.new(2014,12,14).to_s => false,
  Date.new(2014,12,15).to_s => true,
  Date.new(2014,12,16).to_s => false,
}
5.times do |e|
  catedra << alumno.dup
  catedra[e][:nombre] = "alumno-" << e.to_s
  catedra[e][:apellido] ="apellido-" << e.to_s 
  catedra[e][:sexo] = "H"
  catedra[e][:legajo] = e.to_s 
  catedra[e][:asistencias] = asistencia.dup
end

(5..10).each do |e|
  catedra << alumno.dup
  catedra[e][:nombre] = "alumno-" << e.to_s
  catedra[e][:apellido] ="apellido-" << e.to_s 
  catedra[e][:sexo] = "M"
  catedra[e][:legajo] = e.to_s 
  catedra[e][:asistencias] = asistencia.dup
end
puts catedra
puts "\n_________________________________________________________\n\n"
#_______________________________________________________________

legajo = 7
fecha = { Date.new(2014,12,20).to_s => true }
elem = catedra.detect { |a| a[:legajo] == legajo.to_s }
elem[:asistencias].merge!(fecha)
legajo = 2
fecha = { Date.new(2014,12,20).to_s => true }
elem = catedra.detect { |a| a[:legajo] == legajo.to_s }
elem[:asistencias].merge!(fecha) # ver como agregar a una hash mejor manera
puts elem
puts "\n__________________________________________________________\n\n"
#________________________________________________________________

cantH = 0 
cantH = catedra.select { |e| e[:sexo] == "H" }.size

puts "#{ cantH * 100 / catedra.size }% hombres, #{ 100 - cantH * 100 / catedra.size }% mujeres"
puts "\n_______________________________________________\n\n"
#_______________________________________________________________

arreglo_ordenado_por_asistencia = 
  catedra.sort { |a,b| 
    (b[:asistencias].select { | k, v | v == true }.size)  <=> (a[:asistencias].select { | k, v| v == true }.size )
  }

puts arreglo_ordenado_por_asistencia
# agregar .take(5)
puts "\n_________________________________________________________\n\n"

#_______________________________________________________
arreglo_ordenado_por_inasistencia = 
  catedra.sort { |a,b| 
    (b[:asistencias].select { | k, v | v == false }.size)  <=> (a[:asistencias].select { | k, v| v == false }.size )
  }
#agregar .take(5)
puts arreglo_ordenado_por_inasistencia

