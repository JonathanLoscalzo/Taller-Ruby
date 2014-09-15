# 6.  Dado un string cualquiera reemplace cada ocurrencia de
# {  por  do\n
#  y cada ocurrencia de
# }  por end
# . Por ejemplo:
# >  reemplazar("[1, 2, 3, 4].each { |x| a = x**2 + x**3 + x**5\np a\n }")
# =>  "[1, 2, 3, 4].each do\n |x| a = x**2 + x**3 + x**5\np a\n end"
# ¿Puede escribir la función reemplazar en una sola linea aprovechando los métodos de instancia de la clase String?
#

def reemplazar(cadena)
  cadena.gsub(/['{}']/, '{' => "do\n", '}' => 'end')
end

# reemplazar("[1, 2, 3, 4].each { |x| a = x**2 + x**3 + x**5\np a\n }")
