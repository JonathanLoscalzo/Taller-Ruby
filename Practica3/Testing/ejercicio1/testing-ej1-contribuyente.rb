=begin

Crear una clase Contribuyente que tenga los siguientes atributos (todos deben tener accesors):

nombre
apellido
cuit
deuda
ingresos

En caso de no especificarse deuda al instanciar el
 Contribuyente la misma será 0 y en caso de no especificar 
 ingresos se deberá asumir que gana el salario mínimo.
=end

require_relative '../../../Practica2/Clases/contribuyente.rb'
require 'minitest/spec'
require 'minitest/autorun'

describe 'Some custom test' do

  before do
  	index = 1
    @contr = Contribuyente.new(
    		nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s }
	);

	index = 2
	@contr_con_deuda = Contribuyente.new(
			nombre: "nombre-"+index.to_s,
			apellido: "apellido-"+index.to_s,
			cuit: 11.times.inject("") { |acum,k| acum+index.to_s },
			deuda: (100*index)
	)
  end

  after do
    
  end

  it 'debe tener accesors para nombre' do
    @contr.nombre.must_be :==, "nombre-1"
    @contr.nombre = "cambiado"
    @contr.nombre.must_be :==, "cambiado"
  end

  it 'debe tener setters para apellido' do
    @contr.apellido.must_be :==, "apellido-1"
    @contr.apellido = "cambiado"
    @contr.apellido.must_be :==, "cambiado"
  end

  it 'debe tener setters para nombre' do
    @contr.cuit.must_be :==, "11111111111"
    @contr.cuit = "55555555555"
    @contr.cuit.must_be :==, "55555555555"
  end

  it 'debe tener deuda 0 si no se inicializo, y deuda distinta de 0' do
    @contr.deuda.must_equal 0
    @contr_con_deuda.deuda.wont_equal 0
  end

  it 'debe tener setters para nombre' do
    skip
  end
end