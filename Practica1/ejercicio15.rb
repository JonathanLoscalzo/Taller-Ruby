=begin

15.  Analizar y probar el siguiente código:
[ :upcase, :downcase, :capitalize, :swapcase ]. map  do   | symbol |
  "Hola Mundo" . send(symbol)
end

RTA =>

HOLA MUNDO => string.upcase
hola mundo => string.downcase
Hola mundo => String.capitalize
hOLA mUNDO => string.swapcase

Mapea por cada elemento de la colleccion y devuelve una coleccion igual, 
que contiene a los elementos aplicacndo las operaciones.
en este caso se le enviaron mensajes de string


=end

x = [ :upcase, :downcase, :capitalize, :swapcase ]. map  do   | symbol |
  		"Hola Mundo" . send(symbol)
end
print "#{x} \n"

