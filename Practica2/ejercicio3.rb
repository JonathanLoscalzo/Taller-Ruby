=begin


Analice las diferencias entre los siguientes usos de bloques:



a. ¿En qué casos es obligatorio invocar a la función con un bloque? 
b. ¿Qué pasa cuando no se envía un bloque? 
c. ¿Qué retorna cada función?


=end
=begin
	
rescue 

 Es necesario, porque no hay ninguna condicion que me diga que no.
 Es decir no verifica si se envio, solo se deberia enviar.
 CUANDO se llama a YIELD es porque se llamo a un bloque.
	
=end
def fun1
  yield
end


def fun2(&block)
  block.yield
end

def fun3(&block)
  block.yield unless block.nil?
end

def fun4
  yield if block_given?
end