=begin
Implemente una función reduce para ejercitar el uso de bloques 
(sin usar inject ni reduce). La forma de uso de esta función sería:

> p reduce([1,2,3,4,5,6], 1) { |acum, x| acum * x }
=> 720
 nose si habrá otra manera mejor de hacerlo.
=end

def reduce(arr, ini)
	arr.each { | e | ini = (yield ini, e) }
	puts ini
end

p reduce([1,2,3,4,5,6], 1) { |acum, x| acum * x }