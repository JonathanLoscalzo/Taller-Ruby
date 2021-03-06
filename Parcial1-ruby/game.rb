
require_relative './scoremanager'

class Game
	include ScoreManager
	attr_accessor :arreglo
	attr_reader :filename
	def initialize
		@arreglo = []
		@filename = 'score.csv'
		self.charge_scores
	end
	protected :arreglo
end

g = Game.new

puts "====TOP TEN==="
puts g.top_ten
puts "====ACUMMULATED TOP TEN========"
(g.each { |e| e } )

puts g.accumulated_top_ten

puts "========TOP TEN USER BY fernando m. ========="

puts g.top_ten_by_user('fernando m.')

puts "========nuevo usuario========="
g.add_score 'NuevoUsuario', 1234234

puts g.top_ten

