require_relative 'ejercicio4'
require 'minitest/autorun'
require 'minitest/spec'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe 'ejercicio 4 sinatra' do

	it 'get saludo devuelve HOLA MUNDO' do
		get '/saludo'
		last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'HOLA MUNDO'
	end

	it 'get /saludo/:name devuelve HOLA :name' do
		get '/saludo/jonathan'
		last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'HOLA jonathan'
	end

end