require_relative 'ejemplos_teoria'
require 'minitest/autorun'
require 'minitest/spec'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe 'my example server' do
    it 'should succeed with get' do
        get '/'
        last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'This is GET'
    end

    it 'should succeed with delete' do
        delete '/'
        last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'This is DELETE'
    end

    it 'should succeed with put' do
        put '/'
        last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'This is PUT'
    end

    it 'should succeed with post' do
        post '/'
        last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'This is POST'
    end
    it 'should succeed with patch' do
        patch '/'
        last_response.status.must_equal 200
        last_response.must_be :ok?
        last_response.body.must_include 'This is PATCH'
    end

end