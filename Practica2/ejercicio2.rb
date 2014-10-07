=begin


Implemente la función tipos_de_argumentos que se pueda utilizar como se muestra más abajo e
 imprima los argumentos recibidos:

> tipos_de_argumentos 2, 'hello' => 'world', 'amount' => 5
Argumento posicional: 2
Argumentos en el hash
  hello: world
  amount: 5

Nota: esta función solamente recibe un argumento posicional.

tipos_de_argumentos params {'hello' => 'world', 'amount' => 5} , arg = 2

MIRAR como se pueden pasar los parametros al reves. 

RTA : 
Ruby ofrece una solución: puede usarse clave => valor en la lista de argumentos siempre que:

    Sea luego de los argumentos normales
    Antes de un splat y bloque
    Ya no es necesario usar llaves


=end

def tipos_de_argumentos(arg, params)
	p "Argumento posicional: #{arg}"
	p "Argumentos en el hash:"
	#p "prueba : #{params.to_a.join("\n")}"
	params.each { | k,v | p "#{k} : #{v}" }
	return "termine"
end

#para probarlo : 

tipos_de_argumentos 2, 'hello' => 'world', 'amount' => 5

