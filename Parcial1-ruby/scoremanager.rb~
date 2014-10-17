=begin

Se quieren almacenar los scores de un juego. Cada score está compuesto por el nombre de usuario del jugador y los puntos que hizo. 
Esta información tiene que almacenarse en disco a fin de que sea persistente entre diferentes partidas y que puedan ser analizada luego.

La solución (el manejo de scores) debe poder ser reutilizada en diferentes juegos, en un sistema de manejo de multas, en un sistema para calificar exámenes, etc...

Se piden las siguientes consultas:

a. Top 10 scores

b. Top 10 scores acumulados por usuario.

c. Dado un usuario, sus top 10 scores.

d. Dados 2 scores debe ser posible compararlos para saber cuál tiene más puntos.

 @arr = [['user1', 123], ['user2',23]]

=end


module ScoreManager
	require_relative './score'
	require 'csv'
	include Enumerable
	
	def each(&block)
 		self.arreglo.each &block  		
	end

	def top_ten
	#nose porque no ordena  el sort_by, podria sobreescribir array, pero no estaria bueno
		self.to_s_array self.arreglo.sort { | a,b | a.puntaje <=> b.puntaje }.reverse.first(10)
		
	end

	def accumulated_top_ten
		arr = self.compress #un arreglo con cada usuario y su puntaje total
		self.to_s_array	arr.sort { | a,b | a.puntaje <=> b.puntaje }.reverse.first(10)
		
	end

	def top_ten_by_user(username)
		self.to_s_array self.arreglo.select { |obj| obj.username == username }.sort { | a,b | a.puntaje <=> b.puntaje }.reverse.first(10)
	end

	def charge_scores
		#cargar desde disco con csv
		CSV.foreach(self.filename) do |row|
  		self.arreglo << UsuarioPuntaje.new(row[0], row[1].to_i)
		end
	end

	def add_score(user, puntaje)
		self.arreglo << UsuarioPuntaje.new(user.to_s, puntaje.to_i)
		#deberia guardarlo en disco tambien
		f = File.open(self.filename, "a")
		
	end

	def to_s
		str = ""
		self.arreglo.each_with_index do |e, index|
			str << %Q[#{index+1}. #{e.to_s} \n]
		end		
		str
	end

	def to_s_array(array)
		str = ""
		array.each_with_index do |e, index|
			str << %Q[#{index+1}. #{e.to_s} \n]
		end		
		str
	end

	def compress
	#devuelve un hash con los usuarios y los elementos sumados
		arreglo_hash = {}
		self.arreglo.each do | user |
			if arreglo_hash.include? user.username 
				arreglo_hash[user.username] += user.puntaje
			else
				arreglo_hash[user.username] = user.puntaje
			end
		end
		arreglo_hash.inject([]) { |acum, (k,v)| acum << (UsuarioPuntaje.new(k,v)) }
	end
#	private :compress, :charge_score
end
