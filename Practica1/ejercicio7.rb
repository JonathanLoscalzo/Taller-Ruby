# 7.  Si listamos todos los números naturales menores que 10 que son múltiplos de 3 o 5 obtenemos 3, 5, 6 y 9. 
# La suma de todos estos números es 23. Encontrá la suma de todos los múltiplos de 3 o 5 menores que 1000.

x = 0
(1...1000).each { |e| x += e if e % 3 == 0 || e % 5 == 0 }

prueba = (1...1000).reduce(0) { |mem, var| (var % 3 == 0 || var % 5 == 0) ? mem + var : mem + 0 }

respuesta = (1...1000).select { |e| x += e if e % 3 == 0 || e % 5 == 0 }
# otras formas?
