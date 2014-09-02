=begin
7.  Si listamos todos los números naturales menores que 10 que son múltiplos de 3 o 5 obtenemos 3, 5, 6 y 9. 
La suma de todos estos números es 23. Encontrá la suma de todos los múltiplos de 3 o 5 menores que 1000.
=end

x = 0
(1...1000).each { |e| x += e if e%3 == 0 or e%5 == 0 }

prueba = (1...1000).inject(0) { |mem, var| (var%3 == 0 or var%5 == 0) ? mem + var : mem + 0 }

respuesta = (1...1000).find_all { |e| x += e if e%3 == 0 or e%5 == 0 }
# otras formas?

