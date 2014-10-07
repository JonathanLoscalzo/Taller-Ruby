=begin

a. ¿Qué sucede al invocar a cada una de estas funciones con un sólo argumento? b.
En cada caso analizar que sucede al invocar a la función de la siguiente forma: funx(b = 2, a = 1)

 [:fun1, :fun2, :fun3].map { |e| Object.send(e,b=2,a=4) } => para mandarle a los 3 el mismo parametro.
 esto devuelve [8, 8, 8] => por lo tanto ruby acepta parametros por nombre (call by name?)

=end
#_______________________________________________

=begin
	excepcion de cantidad de argumentos.
	Necesita que se le envie la cantidad de argumentos exacta
	si se le envia mas cantidad tambien se rompe por lo mismo.
	wrong number of arguments (x for 2)

	Para el segundo caso fun1(b=2, a=1) funciona.
	Es decir el pasaje de parametros en ruby puede ser 
	->posicional
	->

=end

def fun1(a, b)
  a * b
end
#_______________________________________________

=begin
	wrong number of arguments (x for 1..2)

	Es decir que el segundo argumento se convierte en optativo 

=end

def fun2(a, b = 5)
  a * b
end

#_______________________________________________

=begin
	Este al no tener parametros obligatorios, utiliza el splat
	Los parametros splat tienen la posibilidad de ser 0..N es decir, 
	argumentos variables.
	Si no se le pasan argumentos, da 1. Sino lo que sea que de el inject.
	RECORDAR que splat es en este caso un arreglo.

=end	

def fun3(*a)
  a.inject(1, :*)
end