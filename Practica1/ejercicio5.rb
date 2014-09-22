# 5.  Escriba una función que reciba un hash y retorne un string con las claves y valores del hash formateados en una lista HTML.
# Por ejemplo:
# >  to_html({bananas: 5, naranjas: 10})
# =>  "<ul><li>bananas: 5</li><li>naranjas: 10</li></ul>"
#

def to_html(hash)
  html = '<ul>'
  hash.each { |clave, valor|  html << "<li> #{clave} : #{valor}</li>" }
  html << '</ul>'
end

# var = to_html :bananas => 5 , :naranjas => 10
# var = to_html({:bananas => 5 , :naranjas => 10})
