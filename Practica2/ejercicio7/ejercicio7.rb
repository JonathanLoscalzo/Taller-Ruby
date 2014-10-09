=begin
	
Se provee la clase Maze que permite resolver laberintos, la misma cuenta entre otros con los métodos:

Maze#north, Maze#south, Maze#west, Maze#east: Mueven el jugador
Maze#obstacle_north?, etc...: Retornan true si hay una pared o limite del mapa en la dirección correspondiente.
Maze#win?: Retorna true si se llegó al final del laberinto.
Maze#to_s: Retorna un string con el laberinto y las direcciones cardinales. 
En el string el símbolo @ representa al jugador.


b. La clase Maze provee otro método play, play recibe un bloque y lo ejecuta repetidamente hasta 
que el mismo retorne true, por ejemplo el siguiente código mueve al jugador hacia el este hasta que choque:

require_relative 'maze'
maze = Maze::Maze.new
i = 0
maze.play do
  maze.east
  print maze
  maze.obstacle_east?
end

Escriba un bloque que implemente una estrategia aleatoria para salir del laberinto. 
Como última línea del bloque se puede usar Maze#win? para que la ejecución termine al alcanzar el objetivo.

Ayuda: Considere usar Maze#send para invocar algunos métodos para evitar usar un case o varios if.

=end

require_relative 'maze'

directions = {:obstacle_north? => :north, :obstacle_east? => :east, :obstacle_south? => :south, :obstacle_west? => :west}

directions_enum = directions.to_enum

# a. Haga un programa que aleje al jugador 10 pasos de su posición inicial sin chocar.
maze = Maze::Maze.new
initial_position = maze.position

=begin
	nose si esto es verdad. Para sacar la distancia desde el index 
	[a,b] - [c,d] (elemento a elemento) 
	
=end
def distancia(a,b)
	#hacerlo con un loop "iterar dos collections al mismo tiempo"
	p (a[0]-b[0]).abs + (a[1]-b[1]).abs
end
gets
# i = 0;
# maze.play do
# 	unless (maze.send(directions.keys[i]))
# 		maze.send(directions.values[i])
# 		print maze
# 	else
# 		i = ( i + 1 ) % 4
# 	end
# 	if (distancia(initial_position, maze.position) >= 10)
# 		true
# 	end
# end

s
=begin
	con esto consigo todos los caminos desde un nodo.

	solve (index, maze)
		cola = []
		estado = []
		padre = []
		estado[index] = visitado
		distancia[s] = 0
		cola.encolar (v)
		while !cola.empty? 
			u = cola.desencolar()
			for w in Vecinos(u)
				if estado[w] == no_visitado (si no existe, si existe ya fue visitado)
					estado[w] = visitado
					distancia[w] = distancia[u] + 1
					padre[w] = u
					cola.encolar(w)
				end
			end 
		end 

=end








