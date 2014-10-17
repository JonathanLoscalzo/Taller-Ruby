class UsuarioPuntaje
	include Comparable
	
	attr_reader :puntaje, :username

	def initialize(username, puntaje)
		@username = username
		@puntaje = puntaje
	end
		
	def <=>(other)
		self.puntaje <=> other.puntaje
	end
	
	def to_s
		"#{self.username} - #{self.puntaje}"
	end

end
