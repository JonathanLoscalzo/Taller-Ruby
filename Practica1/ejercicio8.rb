=begin
http://stackoverflow.com/questions/6418524/fibonacci-one-liner

8.  Cada nuevo término en la secuencia de Fibonacci es generado sumando los 2 términos anteriores. 
Los primeros 10 términos son: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55. Considerando los términos en la secuencia de 
Fibonacci cuyos valores no exceden los 4 millones, encontrá la suma de los términos pares.

f(n) =  f(n-1) + f(n+1)

RTA de stackoverflow, parecida a la del profe
puts (1..Float::INFINITY)
.lazy.map{|n| (0..n).inject([1,0]) {|(a,b), _| [b, a+b]}[0] }
.take_while{|n| n < 4000000}
.select{|x| x % 2 == 0}.reduce(:+)
=end

rango = (1..Float::INFINITY)
total = 0
x, y = 0, 1
while true
	x, y = y, x+y
	total += x if (x.even?)
	if x > 4000000 
		break
	end
end

puts total

=begin
#recibe bloque para conocer la secuencia, defino un enumerador, devuelve una secuencia infinita, nunca termina
fib = Enumerator.new do | block |
	a,b  = 1,1
	2.times { block.yield 1}
	loop do
		block.yield a+b
		a,b = b, a+b
	end
end

#Ahora si tiene sentido el lazy, nunca termina de ejecutar. Si pones el take_while antes del select eso funciona

fib.lazy.select(&:even?).take_while {|x| x < 4000000}.inject(:+)
=end

