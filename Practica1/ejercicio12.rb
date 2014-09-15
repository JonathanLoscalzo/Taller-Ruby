# 12.  La lista de los primeros 6 números primos es 2, 3, 5, 7, 11 y 13.
# Se puede observar que el 6to número primo es 13. ¿Cual es el
# número primo nro 10001?
#
require 'prime'

puts Prime.first(10_001).last
puts Prime.lazy.first(10_001).last
