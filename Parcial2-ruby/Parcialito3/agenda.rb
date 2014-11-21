require 'csv'
#===============================================================================
# Esta clase representa la información de un contacto
class Contact
  attr_accessor :name, :email, :birth_date, :phone, :address
  def initialize(name, email, **args)
		
    self.name= name
    self.email= email
# modifico esta parte
		begin
		  self.phone=(args.fetch(:phone))
		rescue => detail
			self.phone=nil
		end
		begin
			self.address= (args.fetch(:address))
		rescue => detail
			self.address=nil
		end

		begin
			self.birth_date=(args.fetch(:birth_date))
		rescue => detail
			self.birth_date=nil
		end
  end

  def to_a
    [@name, @email, @birth_date, @phone, @address]
  end

	def email=(anEmail)
		raise RegexpError unless anEmail =~ /\w+@\w+.com/
		@email = anEmail
	end


end

# Esta clase representa una lista de contactos, que puede ser guardada en un
# archivo, cargada desde un archivo o recorrida de distintas formas
#===============================================================================
class ContactList
  attr_reader :contacts
  def initialize
    @contacts = []
  end

  # Agregar una instancia de la clase contacto
  def <<(contact)
		raise ArgumentError unless (contact.kind_of? Contact)
    @contacts << contact
  end

  # Encontrar un contacto por nombre
  def find_by_name(name)
		@contacts.detect { |c| c.name == name }
    #contacts.select(name)
  end

  # Encontrar un contacto por email
  def find_by_email(email)
		@contacts.detect { |c| c.email == email }
    #contacts.select(email)
  end
#______________________________________________________________________________
#estos no hay que testearlos. Si quizàs corregir los test
  # Cargar contactos desde un archivo CSV
  def load_from_file(filename)
    CSV.foreach(filename) do |row|
      raise IOError if row.size != 5
      @contacts << Contact.new(row)
    end
  end

  # Guardar contactos a un archivo CSV
  def save(filename)
    CSV.open(filename, 'w') do |csv|
      @contacts.each do |contact|
        csv << contact.to_a
      end
    end
  end
#______________________________________________________________________________
  # Aliases para tener distintos nombre para algunos métodos
  alias_method :add, :<<
end
#===============================================================================
