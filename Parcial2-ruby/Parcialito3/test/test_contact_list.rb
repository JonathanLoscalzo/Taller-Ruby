require 'minitest/autorun'
require_relative '../agenda.rb'
require 'minitest/spec'
require 'mocha/mini_test'


describe 'testing ContactList' do
	before do
		
		@contactlist = ContactList.new
		@contact=Contact.new("name1", "este@siexiste.com")
		#@contact.stubs(:email).returns("este@si.existe")
		#@contact.stubs(:name).returns("name1")
	
			
		@contactlist << @contact

		@contact=Contact.new("name2", "este2@siexiste.com")
		#@contact.stubs(:email).returns("este2@si.existe")
		#@contact.stubs(:name).returns("name1")
		
		@contactlist << @contact

		@contact=Contact.new("name3", "este3@siexiste.com")
		#@contact.stubs(:email).returns("este3@si.existe")
		#@contact.stubs(:name).returns("name3")

		@contactlist << @contact	

	end

	it 'must add contact to ContactList and return contact' do
		contact=Contact.new("test", "test@example.com")
		( @contactlist << contact ).must_equal contact
	end

	it 'wont add an non-element contact ' do
		contact=Object.new
		->{ @contactlist << contact }.must_raise ArgumentError
	end

	it 'must return contact find by name ' do 
	
		@contactlist.must_be :find_by_name, "name1"
	end

	it 'wont return contact find by name' do

		(@contactlist.find_by_name "no existe").must_be_nil
	end

	it 'must return contact find by email' do
	
		@contactlist.must_be :find_by_email, "este@siexiste.com"
	end

	it 'wont return contact find by email and return nil' do
		(@contactlist.find_by_email "noExiste@este.email") . must_be_nil
	end

end
