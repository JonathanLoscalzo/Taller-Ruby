=begin
	
Creá una aplicación Sinatra como el siguiente ejemplo e iniciala ya mismo

Usá Google Chrome y presionar F12 para mostrar las Dev Tools. Esto mostrará una ventanita 
en la parte inferior del navegador. Asegurate de seleccionar la solapa Network

Ingresá como URL

http://localhost:4567/codigo/404
y verificá qué muestra la columna Status text. Luego probá con diferentes valores como:
200, 201, 203, 301, 302, 404, 403, 500.

Verificá los códigos que quieras según

http://en.wikipedia.org/wiki/List_of_HTTP_status_codes

1xx => informational

2xx => success

3xx => Redirection

4xx => Client ERROR

Nose porque devuelve eso. Pruebo con curl

=end 

require 'bundler'
Bundler.require

get '/' do
end

get '/codigo/:code' do
  Integer(params[:code])
end