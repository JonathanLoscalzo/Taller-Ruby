=begin

	Defina un módulo Inspector que provea un #out 
	método que imprima en pantalla el estado interno de un objeto de la siguiente manera:

:::::::::::::::::::::::::::: <clase del objeto> (<object_id>) ::::::::::::::::::::::::::::

       <nombre de variable de instancia>  :       <valor de la variable>
       <nombre de variable de instancia>  :       <valor de la variable>
       <nombre de variable de instancia>  :       <valor de la variable>
       ...

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

a. Cree clases que incluyan el módulo posean varias variables de instancia para probarlo.

  class InspectMe
    include Inspector

    #definición del resto de la clase...
  end

  InspectMe.new.out

=end
require_relative 'Inspector'
class ClaseA
	include Inspector
	def initialize
		@a = 1
		@b = 3
		@c = 2
		@@dc = 1
	end
end

ClaseA.new.out


=begin

b. ¿Qué sucedería si el método se llamara #inspect en lugar de #out? Renombre el método, vuelva a incluirlo en la clase de prueba, y pruébelo nuevamente.
	 Este metodo ya existe.
	Lo sobreescribi!. no esta bien esto. tener cuidado con los nombres en los mixins.
	RTA CATEDRA: nombre de metodos
		Primero se busca si la clase del objeto lo implementa
		Luego en los mixins incluidos por la clase. Si tiene varios módulos, el último será el considerado
		Luego en la superclase
	La solucion es usar dinstintos nombres. Son el mismo namespaces
=end

ClaseA.new.inspect


=begin
c. Luego de renombrar el método, ejecute las siguientes líneas:

class Object
  include Inspector
end
d.¿Qué sucede ahora? ¿Por qué?

Nota:

Para acceder a las variables de instancia de un objeto revise cómo se utilizan los siguientes métodos:

Object#instance_variables
Object#instance_variable_get
Para obtener el nombre de la clase de un objeto pueden utilizar los métodos:

Object#class
Class#name
100.class #=> Fixnum
100.class.name #=> "Fixnum"

=end