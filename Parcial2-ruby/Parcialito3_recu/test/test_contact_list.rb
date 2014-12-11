require 'minitest/autorun'
require_relative '../agenda.rb'
require 'minitest/spec'


describe 'testing ContactList' do
	before do
		#me parece que no deberia agregar acá
		@contactlist = ContactList.new
		@contact=Contact.new("name1", "este@siexiste.com")
					
		@contactlist << @contact

		@contact=Contact.new("name2", "este2@siexiste.com")
			
		@contactlist << @contact

		@contact=Contact.new("name3", "este3@siexiste.com")
		
		@contactlist << @contact	

	end

	it 'must add contact to ContactList and return contact' do
		contact=Contact.new("test", "test@example.com")
		( @contactlist << contact ).must_equal contact
	end

	it 'wont add an non-element contact ' do
		contact=Object.new
		->{ @contactlist << contact }.must_raise ArgumentError
		->{ @contactlist << nil }.must_raise ArgumentError
	end

	it 'must return contact find by name ' do 
		@contactlist.must_be :find_by_name, "name1"
		@contactlist.must_be :find_by_name, "name2"
		@contactlist.must_be :find_by_name, "name3"
	end

	it 'wont return contact find by name' do
		(@contactlist.find_by_name "no existe").must_be_nil
	end

	it 'must return contact find by email' do
		@contactlist.must_be :find_by_email, "este@siexiste.com"
		@contactlist.must_be :find_by_email, "este2@siexiste.com"
		@contactlist.must_be :find_by_email, "este3@siexiste.com"
	end

	it 'wont return contact find by email and return nil' do
		(@contactlist.find_by_email "noExiste@este.email") . must_be_nil
	end

end
