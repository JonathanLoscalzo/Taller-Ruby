=begin
	
	Impuesto#monto_a_pagar(contribuyente) retorna el monto a pagar por el contribuyente dado.

	Impuesto#calculo(&bloque) usa el bloque dado para calcular 
el monto a pagar en futuras invocaciones del método Impuesto#monto_a_pagar.

Al instanciar un Impuesto se asume que el monto a 
pagar será el 3% de los ingresos y si el Contribuyente tiene deuda se sumará la deuda más un 15% sobre el total.

Lo que me costo un huevo


=end

require_relative '../../../Practica2/Clases/impuesto.rb'
require_relative '../../../Practica2/Clases/contribuyente.rb'

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/mini_test'

describe 'funcionamiento de impuesto' do 
	before do
		# como se mockea? ver mocha y el otro

		@impuesto = Impuesto.new("TESTING");
		index = 1

		@contr = mock()
		@contr_con_deuda = mock()
		@contr.stubs(:deuda).returns(0)
		@contr.stubs(:ingresos).returns(1000)
		@contr_con_deuda.stubs(:deuda).returns(200)
		@contr_con_deuda.stubs(:ingresos).returns(1000)

=begin
		@contr = Contribuyente.new(
    		nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s }
		) # => deberia dar

		index = 2
		@contr_con_deuda = Contribuyente.new(
			nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s },
			deuda: (100*index)
		) # => deberia dar
=end
	end

	it ' si funciona calculo por defecto ' do 
		(@impuesto.monto_a_pagar (@contr)).must_equal 30.0
		(@impuesto.monto_a_pagar @contr_con_deuda).must_equal 264.5
	end

	it ' si funciona con otro bloque ' do
		block = lambda do |cont|
			if cont.deuda == 0
				(cont.ingresos.to_f * 5.00 /100.00).round(2)
			else 
				imp1 = cont.ingresos.to_f * 3.00 /100.00 + cont.deuda
				(imp1 * 120.00 /100.00).round(2)
			end
		end
		
		@impuesto.calculo(&block)
		(@impuesto.monto_a_pagar (@contr )). must_equal 50.0
		(@impuesto.monto_a_pagar @contr_con_deuda).must_equal 276.0
	end


end


