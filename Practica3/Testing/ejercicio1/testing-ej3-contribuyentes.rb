=begin
Crear una clase Contribuyentes, la misma deberá ser una colección de objetos Contribuyente que permita realizar las siguientes acciones:

Agregar un Contribuyente a la colección (verificar que no haya cuits duplicados).
Obtener un listado de los contribuyentes que tengan una deuda del 50% o más de sus ingresos.
Obtener un listado de los contribuyentes sin deuda.
La clase Contribuyentes deberá incorporar los comportamientos de Enumerable.
max, min y sort deberán operar en base a los ingresos del Contribuyente.

=end
require_relative '../../../Practica2/Clases/contribuyentes.rb'

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/mini_test'



describe 'testeando contribuyentes' do

  before do
    @contribuyentes = Contribuyentes.new

    @contr = mock()
    @contr.stubs(:deuda).returns(0.0)
    @contr.stubs(:ingresos).returns(1000.0)
    @contr.stubs(:cuit).returns(11111111111)

    @contr2 = mock()
    @contr2.stubs(:deuda).returns(0.0)
    @contr2.stubs(:ingresos).returns(2000.0)
    @contr2.stubs(:cuit).returns(22222222222)

    @contr3 = mock()
    @contr3.stubs(:deuda).returns(500.0)
    @contr3.stubs(:ingresos).returns(1000.0)
    @contr3.stubs(:cuit).returns(33333333333)

    @contr4 = mock()
    @contr4.stubs(:deuda).returns(499.0)
    @contr4.stubs(:ingresos).returns(1000.0)
    @contr4.stubs(:cuit).returns(44444444444)

  end

  after do
    
  end

  it 'no deberia agregar contribuyentes repetidos' do

   	(@contribuyentes.addContribuyente @contr)  .must_be :include?, @contr
   	(@contribuyentes.addContribuyente @contr2) .must_be :include?, @contr2
    (@contribuyentes.addContribuyente @contr3) .must_be :include?, @contr3
   	(@contribuyentes.addContribuyente @contr4) .must_be :include?, @contr4

   	lambda do  
   		@contribuyentes.addContribuyente @contr
   	end .must_raise Exception

   	lambda { @contribuyentes.addContribuyente @contr2 }.must_raise Exception
  	lambda { @contribuyentes.addContribuyente @contr3 }.must_raise Exception
    lambda { @contribuyentes.addContribuyente @contr4 }.must_raise Exception

  end

  it 'deberia obtner contribuyentes con deuda menor a 50%' do

  	@contribuyentes.addContribuyente @contr3 #=> deuda 500 sobre 1000
    @contribuyentes.addContribuyente @contr4 #=> deuda 499 sobre 1000

    @contribuyentes.con_deuda_mayor_50_porciento.must_be :include?, @contr3
    @contribuyentes.con_deuda_mayor_50_porciento.wont_be :include?, @contr4
    
  end

  it 'deberia devolver contribuyentes sin deuda' do
  	@contribuyentes.addContribuyente @contr2 # sin deuda
    @contribuyentes.addContribuyente @contr4 # con deuda

    @contribuyentes.sin_deuda.must_be :include?, @contr2.cuit
    @contribuyentes.sin_deuda.wont_be :include?, @contr3.cuit

  end
end