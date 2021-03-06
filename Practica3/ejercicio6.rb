
=begin
	Cree la clase Robot y la clase Humano, implemente:

	    Robot#atacar que recibe una instancia de que matar.
	    Robot#tirar_pilas que recibe un símbolo que indica en que lugar se descartarán las pilas.
	    Humano#recibir_ataque que recibe la instancia del atacante.

	El método Robot#atacar deben seguir las 3 leyes de la robótica y además la ley 0.
	<http://es.wikipedia.org/wiki/Tres_leyes_de_la_rob%C3%B3tica>
1)Un robot no puede hacer daño a un ser humano o, por inacción, permitir que un ser humano sufra daño.
2)Un robot debe obedecer las órdenes dadas por los seres humanos, excepto si estas órdenes entrasen en conflicto con la 1ª Ley.
3)Un robot debe proteger su propia existencia en la medida en que esta protección no entre en conflicto con la 1ª o la 2ª Ley.1
0=Un robot no puede hacer daño a la Humanidad o, por inacción, permitir que la Humanidad sufra daño.

	Cuando un robot reciba una orden que vaya contra las leyes debe lanzar una exepción con una descripción acorde.

	Por ejemplo:

	luke = Humano.new
	c3po = Robot.new
	r2d2 = Robot.new

	c3po.atacar luke # Debe lanzar una exepción porque viola la ley 2.
	c3po.atacar r2d2 # No viola ninguna ley
	c3po.atacar c3po # Viola la 3° ley
	c3po.tirar_pilas :cesto_reciclables # No viola ninguna ley
	c3po.tirar_pilas :mar # Viola la ley 0
	c3po.tirar_pilas :sdadwe # Lanza una excepción porque el lugar no es válido

=end

class Robot
	
	def atacar(quien)
		#doble dispatch
		quien.recibir_ataque self
		@lugares = {:viola => [:mar], :no_viola => [:cesto_reciclables]}
	end

	def tirar_pilas(donde)
		lugar_donde = @lugares.invert.detect() { |c,v| c.include? donde }
		
		raise Exception, "#{donde} viola la ley 0" if lugar_donde == :viola

		raise Exception, "#{ donde } No machea con ningun sitio. ERROR" if lugar_donde == nil

		puts "#{donde} no viola la ley 0"

	end

	def recibir_ataque(atacante)
		#recontra trucho.
		raise Exception, "Violando 3ra ley" if atacante == self
		puts "Recibo ataque de #{atacante}" 
	end
end

class Humano
	def recibir_ataque(atacante)
		#medio trucho el doble dispatch este jaja
		raise Exception, "violando 2da ley" if atacante.instance_of? Robot
		
	end

end
=begin
	luke = Humano.new
	c3po = Robot.new
	r2d2 = Robot.new

	c3po.atacar r2d2

	begin
	c3po.atacar luke 
	rescue Exception => e
		puts e
	end

	begin
	c3po.atacar c3po 
	rescue Exception => e
		puts e
	end


	begin
	c3po.tirar_pilas :cesto_reciclables 
	rescue Exception => e
		puts e
	end

	begin
	c3po.tirar_pilas :mar
	rescue Exception => e
		puts e
	end

	begin
	c3po.tirar_pilas :sdadwe
	rescue Exception => e
		puts e
	end
=end
	
