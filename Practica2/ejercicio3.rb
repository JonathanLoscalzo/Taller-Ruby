=begin


Analice las diferencias entre los siguientes usos de bloques:



a. ¿En qué casos es obligatorio invocar a la función con un bloque?
en el caso que no se consulta si un bloque fue enviado como parametro y 
se asume que existe. (fun1, fun2) 
b. ¿Qué pasa cuando no se envía un bloque? 
en los primeros 2 casos.
fun1: no block given (yield) (LocalJumpError) => no existe yield
fun2: undefined method `yield' for nil:NilClass (NoMethodError) => el bloque es nil y nil n otiene el method .yield
c. ¿Qué retorna cada función?
retorna la ejecucion del bloque en cada caso. 
[:fun1, :fun2, :fun3, :fun4].map { | funx | Object.send(funx) { 2*3*4 } }
es interesante esto. No necesito enviarle el bloque entre los corchetes!
siempre devuelve la evaluacion del bloque

=end
=begin
	
 Es necesario, porque no hay ninguna condicion que me diga que no.
 Es decir no verifica si se envio, solo se deberia enviar.
 CUANDO se llama a YIELD es porque se llamo a un bloque.
	
=end
def fun1
  yield
end

=begin
	
En este caso sucede lo mismo que en el anterior. Espera el bloque. si no lo recibe
Tira error porque no existe la variable. Se tiene que ver siempre si 
un bloque fue entregado 

=end
def fun2(&block)
  block.yield
end
=begin

	unless es como un ifNot
	en este caso, pregutna si el bloque no es nil
	if !block.nil? supongo que seria lo mismo
	Y lo devuelve. Sino no hace nada.	

=end

def fun3(&block)
  block.yield unless block.nil?
end
=begin
	
en el ultimo caso, el bloque es implicito como en el primer caso,
pero se pregunta si el bloque existe
unless !block_given	?
=end
def fun4
  yield if block_given?
end