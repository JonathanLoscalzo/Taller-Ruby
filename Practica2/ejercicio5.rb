=begin
Pruebe los siguientes fragmentos de código y analice los resultados:


a.
->proc no controla los parametros, en cambios lambda si
-> proc sale de la ejecucion del bloque en cambio lambda solod el lambda. 
		http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
		"Second, there is a difference in the way returns are handled from the Proc. A return from Proc.new returns 
		from the enclosing method (acting just like a return from a block, more on this later):
		While return from lambda acts more conventionally, returning to its caller:"
=end 

def fun1
  proc { return 'sale del bloque' }.call
  'sale de fun1'
end

def fun2
  -> { return 'sale del lambda' }.call
  'sale de fun2'
end

p fun1
p fun2

=begin
	
	Actually, there are two slight differences between lambda and Proc.new. 
	First, argument checking. The Ruby documentation for lambda states: 
	Equivalent to Proc.new, except the resulting Proc objects check 
	the number of parameters passed when called. Here is an example to demonstrate this:
	
=end

lambda1 = -> (a, b) { puts a, b }
bloque1 = proc { |a, b| puts a, b }
bloque1.call 2, 5 #ok
bloque1.call 2 #ok
lambda1.call 2, 5 #ok
lambda1.call 2 #no funciona. 