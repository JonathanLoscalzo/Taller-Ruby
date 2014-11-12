#Pruebe las diferencias entre Hash#[] y Hash#fetch con uno y con dos argumentos.

h = { "a" => 100, "b" => 200 }
h.fetch("a")                            #=> 100 devuelve el valor si existe, sino excepcion(error). Detiene el sistema.
h.fetch("z", "go fish")                 #=> "go fish" agrega clave valor
h.fetch("z") { |el| "go fish, #{el}"}   #=> "go fish, z". Si no existe, ejecuta el bloque (trapea)

h = { "a" => 100, "b" => 200 }
h["a"]   #=> 100 
h["c"]   #=> nil, el otro devolvia una excepion.
h["a"] = 9
h["c"] = 4
h   #=> {"a"=>9, "b"=>200, "c"=>4}
