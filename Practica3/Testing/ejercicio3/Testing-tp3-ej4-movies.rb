=begin
Testeando MoviesApi.
Inyeccion de dependencia para inyectar el objeto http. (ver que metodos necesita.)

el http:: necesita tener el metodo :get(uri)
Deberia devolver algo digamos. No lo del ejemplo sino lo que yo le pongo.
=end

require_relative '../../ejercicio4'
require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/mini_test'


describe 'testing movie api' do
	
	before do
		@movie = Movies.new
	end
# => Estamos testeando el metodo #search.
	it 'deberia devolver un inyect' do
		@http = Object
		mi_hash = {"hola"=> "como estas", "probando" => "es dificil..."}
		@http.stubs(:get).returns(JSON.generate(mi_hash))

		a = @http.instance_methods

		@http.stubs(:instance_methods).returns(a << :get )

		@movie.search(title: "hola", year: 2004, http:@http).must_equal mi_hash

	end

	it 'deberia devolver excepcion si el año esta mal' do

		@year = 2000
		@movie.search(title:'spiderman', year:2000). wont_be_empty
		
		@year = "200a1"
		->{ @movie.search(title:"hola", year:@year) }. must_raise TypeError
		
		@year = "2001a"
		->{ @movie.search(title:"hola", year:@year) }. must_raise TypeError

		@year = "a2001"
		->{ @movie.search(title:"hola", year:@year) }. must_raise TypeError

	end

	it 'deberia devolver excepcion si http no devuelve get' do
		
		@http = Object # => no recibe :get

		->{ @movie.search(title:"spiderman", year:2000, http: @http) }. must_raise TypeError
	end
end