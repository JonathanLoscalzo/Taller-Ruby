require 'minitest/autorun'
require_relative '../agenda.rb'
require 'minitest/spec'

describe 'Contact test methods' do

	before do
		@arr = ["name", "email@email.com", {:birth_date => "12/12/12", :phone => "456-4569", :address =>"adress"}]
		@contact = Contact.new *@arr
	end

	it 'to_a must return an array' do
		@contact.to_a . must_equal ["name", "email@email.com", "12/12/12", "456-4569", "adress"]
	end

	it 'must be nil with email ok ' do
		(@contact.email="holatodos@example.com"). must_equal "holatodos@example.com" 
	end

	it 'must be RegexpError with email ko' do
		->{ @contact.email="asdfasdf"} .must_raise RegexpError
	end

end

=begin
Correcciones anteriores

* los tests no corren por errores de sintaxis
* no se podía usar nada mas que minitest. Hay tests que no corren porque requeris la gema mocha
* faltan los test de ContactList#add, tanto los casos buenos como los casos límite (por ejemplo, al agregar algo que no es un contacto o es nil)

=end
