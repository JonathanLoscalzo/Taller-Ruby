module Inspector

	def out
		string = ":::::::::::::::::::::: #{self.class.name} (#{self.object_id.to_s}) ::::::::::::::::::::::::::"
		string += self.instance_variables.inject("\n") do | acum, var |
					acum + var.to_s + " : " + (self.instance_variable_get(var)).to_s + "\n"
				end
		ult = ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
		string += ult	
		puts string
	end

	def Inspector.inspect
		string = ":::::::::::::::::::::: #{self.class.name} (#{self.object_id.to_s}) ::::::::::::::::::::::::::"
		string += self.instance_variables.inject("\n") do | acum, var |
					acum + var.to_s + " : " + (self.instance_variable_get(var)).to_s + "\n"
				end
		ult = ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n"
		string += ult	
		puts string
	end

end