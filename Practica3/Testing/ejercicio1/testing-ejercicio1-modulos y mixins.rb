=begin
	Mi primer test en ruby.
	Vamos a ser cancheros  y usar Minitest/spec

=end

require_relative '../../../Practica2/Modulos y Mixin/ejercicio1'
require 'minitest/autorun'
require 'minitest/spec'

describe 'Testeando_Funcionalidad_EJ1_MIXINS' do
	before do
		@var = TTPS::Resolving::Scopes.new()
	end

	after do

	end

	it 'el numero sea multiplicado por la constante definida en el módulo Resolving' do
		x = -10
  		while x < -1 do
  			@var.access(x).must_equal (x*5)
  			x+=1
		end
		
	end

	it 'el numero sea multiplicado por la constante definida en el módulo TTPS' do
		@var.access(0).must_equal(20)
	end

  	it 'devuelva el valor de la constante definida en el namespace global' do
  		x = 1
  		while x < 10 do
  			@var.access(x).must_equal(x*10)
  			x+=1
		end
	end
end