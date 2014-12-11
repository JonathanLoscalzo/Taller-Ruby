=begin
Armar un examen multiple-choice con 5 preguntas de Ruby e implementar una aplicación Sinatra 
que permita tomar ese examen. El funcionamiento de la aplicación deberá ser el siguiente:

Observaciones:

Utilizar la cookie session para persistir los datos.

Para acceder a /question/:number y a /califications es necesario estar logeado, caso contrario redirigir a /login.

En todas las ventanas deberá haber un link que permita desloguearse.

En cada sesión un usuario puede rendir hasta 3 veces, luego deberá mostrarse un mensaje indicando que 
no se puede volver a rendir el examen cuando el usuario intente acceder a /question/:number.

La nota se calcula como el promedio de todos los intentos penalizando con un 10% en cada intento extra.

=end

require 'bundler'
Bundler.require


set :method_override, true #https://github.com/zhengjia/sinatra-explained/blob/master/app/tutorial_2/tutorial_2.md
enable :sessions
set :layout, true

require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

helpers do
	def is_logged
		#devuelve si una session ya esta iniciada (no terminada)
		!session[:name].nil?
	end

	def start_session(name)
		#comenzar una session. Activa los valores a guardar en la variable session
		session[:name] = name
		session[:intentos] = 0
		session[:calificaciones] = [0,0,0]
	end

	def stop_session
		session[:name] = nil
		session[:intentos] = 0
		session[:calificaciones] = [0,0,0]
	end

	def calificaciontotal
		session[:calificaciones].inject(0,:+)
	end

	def all_questions
		["pregunta1??", "pregunta2??", "pregunta3??", "pregunta4??", "pregunta5??"]
	end

	def all_answers
		[
			["respuesta1","respuesta2", "respuesta3","respuesta4"],
			["respuesta1","respuesta2", "respuesta3","respuesta4"],
			["respuesta1","respuesta2", "respuesta3","respuesta4"],
			["respuesta1","respuesta2", "respuesta3","respuesta4"],
			["respuesta1","respuesta2", "respuesta3","respuesta4"]
		]
	end

	def all_corrects
		[[0,1],[1],[2],[1,2,3],[0,1,2,3]]
	end

end

# / y /login permiten a un alumno iniciar una sesión escribiendo su nombre y luego redirigen a la primer pregunta.
get '/' do
  redirect to('/login')
end

get '/login' do
	if !is_logged
		erb :loginView
	else
		erb :homeView
	end
end

post '/login' do
	if !is_logged 
		start_session params[:name]
	end
	erb :homeView
end

get '/logout' do
	stop_session
	redirect to('/login')
end


#/califications muestra el número de intentos, la calificación de cada intento y la calificación total.
get '/califications' do

	#numero de intentos =>
	#calificacion de cada intento =>
	#calificacion total =>

	redirect to("/login")
end

#/question/:number muestra la pregunta al alumno, un botón retroceder y un botón de avanzar.
get '/question/:number' do | number |
	if is_logged && number.to_i < 5
		@question = all_questions[number.to_i]
		@answers = all_answers[number.to_i]
		@id = number.to_i
		erb :questionsView
	else
		redirect to('/login')
	end
end

post '/question/:number' do |number|
	#anotar las correctas o no?. params.to_s
end

