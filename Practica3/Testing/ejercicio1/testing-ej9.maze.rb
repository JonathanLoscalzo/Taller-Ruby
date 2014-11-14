=begin
Testing MAZE ej9 -  Practica 2

=end

require_relative '../../../Practica2/ejercicio7/maze'
require_relative '../../../Practica2/ejercicio7/solve_maze'

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/mini_test'


describe 'probando el ejercicio del laberinto' do 

	before do
		#@directions = {:obstacle_north? => :north, :obstacle_east? => :east, :obstacle_south? => :south, :obstacle_west? => :west}
		#@directions_enum = directions.to_enum # para recorrerlo.
		@maze = Maze::Maze.new
		@anotherMap =  <<-EOS
+---------------------------------+
|                                 |
+------+       +---------------+  |
|                              |  |
+------------------+  +-----+--+  |  
|                  |  |     |   @ |
|  +----+   +------+  |  |  +-----+
|  |    |             |  |        |
|  |    +-------------+  +----+   |
|                             |   |
|-----------------------------+   |
|                                 |
+-------------+     +-------------+
  EOS
	end

	it 'deberia estar a 10 de su posicion inicial' do
		initial_position = @maze.position

		final_position = alejarme_10_pasos(@maze)

		distancia(final_position, initial_position) . must_be :>=, 10
	end

	it 'probar que funciona solve_maze' do
		SolveMaze::solve(@maze).last .must_equal [1,5]
		other_maze = Maze::Maze.new(@anotherMap)
		SolveMaze::solve(other_maze).last .must_equal [4, 20]
	end

end 

def alejarme_10_pasos (maze)
  i = 0;
  initial_position = maze.position
  directions = {:obstacle_north? => :north, :obstacle_east? => :east, :obstacle_south? => :south, :obstacle_west? => :west}
  directions_enum = directions.to_enum # para recorrerlo.
  maze.play do
  	unless (maze.send(directions.keys[i]))
  		maze.send(directions.values[i])
  		print maze
  	else
  		i = ( i + 1 ) % 4
  	end
  	if (distancia(initial_position, maze.position) >= 10)
  		return maze.position
  	end
  end
end

def distancia(a,b)
	"============#{a},#{b}======================="
	#hacerlo con un loop "iterar dos collections al mismo tiempo"
	(a[0]-b[0]).abs + (a[1]-b[1]).abs
end