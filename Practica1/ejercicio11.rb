#
# 11.  La suma de los cuadrados de los primeros 10 números naturales es 385 (1^2^ + 2^2^ + ... + 10^2^ = 385).
# El cuadrado de la suma de los primeros 10 números naturales es 3025 ((1 + 2 + ... + 10)^2^ = 55^2^ = 3025).
# Por lo tanto, la diferencia entre el cuadrado de la suma y la suma de los cuadrados de los primeros
# 10 números naturales es 2640 (3025 - 385 = 2640).
# Encontrá la diferencia entre el cuadrado de la suma y la suma de los cuadrados de los primeros 100
# números naturales.
#
#
# para la suma de los cuadrados  = > http://www.wolframalpha.com/input/?i=sum+2%5En&lk=4&num=1
# para el cuadrado de la suma => n*n+1 / 2 ^ 2

def problema(num)
  cuadrados_suma = ((num * (num + 1)) / 2)**2 # => ((1..num).inject() { |sum, var| sum + var})**2
  suma_cuadrados = (1..num).reduce(0) { |sum, var| sum + var**2 }
  cuadrados_suma - suma_cuadrados
end

puts problema(10)
puts problema(100)
