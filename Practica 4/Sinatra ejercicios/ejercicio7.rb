=begin

Escribí una aplicación Sinatra que tenga 3 rutas:

/uno
/dos
/tres
Las tres acciones compartirán la misma vista:


Ejemplo: si agregamos una ruta "/login":

get '/login' do
    form method: :post, action: '/login' { submit 'Entrar' }
end
En el cliente deberá recibir:

<form method="post" action="/login">
    <input type="submit" value="Entrar">
</form>
Nota: La indentación está sólo por claridad, no es necesario generar el código de salida indentado.

=end

require 'bundler'
Bundler.require

set :method_override, true #https://github.com/zhengjia/sinatra-explained/blob/master/app/tutorial_2/tutorial_2.md

before do
	#esto es un filtro
  @now = 'hola!!!!'
end

helpers do
	#puedo usarlos en la vista!
	def now
	@now = 'hola x 2 !!! '
	end

	def form(method:, action:) 
=begin
  	Ejemplo: si escribimos en un .erb:

	<%=form method: :put, action: '/number' %>
	Nuestro helper deberá retornar el string:

	<form method="post" action='/number'>

	<input type="hidden" name="_method" value="put">

	</form>

	Nota: investigá la opción method_override.

	El form anterior no es demasiado útil ya que no es sencillo agregar inputs dentro del formulario. 
Agregale a form la capacidad de recibir bloques, en caso que invoquemos a form con un bloque 
deberá ejecutarlo para generar todos los inputs que le pidamos.

=end
	action.downcase!
	if (method != "put" && method != "delete")
		a = %Q[ <form action="#{action}" method="#{method}"> ]
		(a << yield) if block_given?
	else
		a = %Q[ <form action="#{action}" method="post"> ]
		(a << yield ) if block_given?
		a << %Q[ <input type="hidden" name="_method" value="#{method}" /> ]
	end
	a<<"</form>"	
	a
	
	end

	def submit(value:"")
=begin
	Agregá el helper submit que dado el texto a mostrar deberá generar un botón submit.
	Ejemplo: si agregamos en el template:

	<%= submit "Enviar" %>
	Deberá retornar:

	<button type="submit" value="Enviar"></button>

=end
	%Q[<button type="submit">#{value}</button>]
	end

end

get '/uno' do
	#Implementá la solución de forma tal que la variable @now, sólo debe setearse una vez usando filtros.
  erb :ejercicio7
end

get '/dos' do
	#Implementá la solución, pero en vez de usar la variable @now usá un helper llamado now.
  #seteando
  erb :ejercicio7
end

get '/tres' do
=begin
Definí un helper de nombre form que reciba los argumentos method y action y devuelva el código HTML de un formulario. 
Para simular métodos que no sean ni GET ni POST el helper deberá generar 
un form con método post y agregar un campo oculto con el verbo HTML que realmente queremos utilizar.
=end
	@formulario = form method:"put", action:"/form" do 
		%Q[<input type="textarea">]
	end
  erb :ejercicio7
end

post '/form' do
	"formulario por POST!"
end

put '/form' do 
	"formulario por put!"
end

delete '/form' do

	"formulario por delete!"
end