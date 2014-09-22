# 13.  La suma de los primos menores que 10 es 17 (2 + 3 + 5 + 7 = 17).
# Encontrá la suma de todos los primos menores que 2 millones.
#
require 'prime'

puts Prime.take_while { |x| x <= 2_000_000 }.reduce(0) { |mem, var| mem + var }

# seguramente haya una manera mas rapida de hacerlo con lazy o algo asi.
