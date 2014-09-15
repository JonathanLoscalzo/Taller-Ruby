#
# 4.  Dado un arreglo de strings cualquiera, es necesario escribir un método que devuelva un arreglo con la longitud de dichos strings.
# Ejemplo: dado ['Ruby', 'is', 'awesome'] debe retornar [4, 2, 7]
#
# funciona length y size, cual es la diferencia nose.
# Collect collecta por cada elemento, y genera una colleccion del mismo tipo
#

def long_string(arr)
  arr.map(&:length)
end

arr = ['hola', 'no', 'se', 'que', 'estoy haciendo']
arr2 = %w(Ruby is awesome)

print "#{long_string(arr)} \n"
print "#{long_string(arr2)} \n"
