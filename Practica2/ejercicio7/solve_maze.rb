require_relative 'maze'

class SolveMaze 
	@directions = {:obstacle_north? => :north, :obstacle_east? => :east, :obstacle_south? => :south, :obstacle_west? => :west }
	@directions_reverse = { :north => :south, :south=>:north, :east => :west, :west => :east }

	@cola = []  # => [[1,2],[3,2]]  
	@estado = [] # => [[1,2],[2,3],[4,2]] 
	@camino = {} # => {[1,2] => [2,3]} hijo => padre.
	@distancia = {} #=> {[1,2] => 3} nodo => distancia nodo inicial.
	@fin = []
	@sol = {}
	@res = []
	@initial_position = []
	def SolveMaze.solve(maze) 
		@initial_position = maze.position
		for row in 0..maze.height do
			for col in 0..maze.width do
				@distancia[[row,col]] = 0
			end
		end
		@camino[@initial_position] = nil # o nil
		self.visit(maze)
		self.reconstructPath 
		p @res
	end
private
	def SolveMaze.reconstructPath
		pos = @initial_position
		while (pos != @fin)
			@res.push(pos)
			pos = @sol.key(pos)
		end
	end

	def SolveMaze.visit(maze)
		unless maze.win? 
			position = maze.position
			@estado << position
			@direcciones_vecinos = @directions.reject { | k,v | maze.send(k) } 
			@direcciones_vecinos.each do | k,v |  
				maze.send(v)
				unless (@estado.include?(maze.position) )
					@camino[maze.position] = position
					@distancia[maze.position] = @distancia[position] + 1
					if (self.visit(maze))
						return @sol
					end
					@camino.delete(maze.position)
					@distancia.delete(maze.position)
				end
				maze.send(@directions_reverse[v])
			end
		else
			@fin = maze.position
			@sol = @camino
			return true
		end
		return false
	end
end


maze = Maze::Maze.new

SolveMaze::solve(maze)
