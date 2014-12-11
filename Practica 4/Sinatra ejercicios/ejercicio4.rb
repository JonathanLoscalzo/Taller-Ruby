=begin
4-Escribí una aplicación Sinatra a la que accediendo por un navegador web a la ruta
 /saludo imprima el mensaje Hola mundo!. Pero si accede a /saludo/juan imprima Hola juan!.

Al iniciar la aplicación, leé los mensajes para entender en qué puerto hay que redireccionar el navegador

No te olvides de escribir los tests
=end

require 'bundler'
Bundler.require


get '/saludo' do
  'HOLA MUNDO!'
end

get '/saludo/:name' do |name| 
	%Q[HOLA #{name}]
end