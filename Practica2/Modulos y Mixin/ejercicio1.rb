
=begin
Dada las siguientes definiciones de módulos, clases y constantes:

module TTPS
  CONSTANTE = 10

  module Resolving
    CONSTANTE = 5

    class Scopes
      def access(number)
        ...
      end
    end
  end
end

CONSTANTE = 20

Implementar el método #access de la clase TTPS::Resolving::Scopes de manera que si el número recibido:

    si es < 0 => sea multiplicado por la constante definida en el módulo Resolving
    si es > 0 => sea multiplicado por la constante definida en el módulo TTPS
    si es = 0 => devuelva el valor de la constante definida en el namespace global

=end

module TTPS
  CONSTANTE = 10

  module Resolving
    
    CONSTANTE = 5

    class Scopes
      def access(number)
	
        case(number)
	when (-Float::INFINITY...0)
		TTPS::Resolving::CONSTANTE * number
	when (0)
		::CONSTANTE 
	when (0..Float::INFINITY) 
		number * TTPS::CONSTANTE
	end
      end
    end
  end
end

CONSTANTE = 20

a = TTPS::Resolving::Scopes.new()
p a.access (-15)
p a.access (0)
p a.access (5)
p TTPS::Resolving::CONSTANTE * -1

