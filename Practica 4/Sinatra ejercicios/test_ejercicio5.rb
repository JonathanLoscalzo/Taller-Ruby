require_relative 'ejercicio5'
require 'minitest/autorun'
require 'minitest/spec'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe 'ejercicio 5 sinatra' do

	it 'get con codigo 200' do
		get '/codigo/200'
		last_response.status.must_equal 200
        last_response.must_be :ok?
	end

	it 'get con codigo 404' do
		get '/codigo/404'
		last_response.status.must_equal 404
		last_response.wont_be :ok?
	end
end