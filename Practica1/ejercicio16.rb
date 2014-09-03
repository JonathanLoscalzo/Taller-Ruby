=begin

16.  a. Dado un color expresado como una combinación RGB calcular su representación entera. 
Consideramos que un color rgb se
expresa como un hash con las claves [:red, :green, :blue], 
y para cada una toma valores en el rango (0..255). Por ejemplo:
 
{ red: 0, green: 0, blue: 255 } => 
 
{ red: 128, green: 128, blue: 255 } 

La representación entera se calcula como: red + green*256 + blue*256^2

b. Realizar el mismo cálculo obteniendo los coeficientes para cada componente del color de 
otro hash coefficients = { red: 256**0, green: 256**1, blue: 256**2 }

=end

$hash = {:red => 0, :green =>1, :blue => 2}
$coefficients = {:red => 256**0, :green => 256**1, :blue => 256 **2}

def entero_rgb(rgb)

	rgb.inject(0) { |total, (key, value) | total + value*$coefficients[key] } #=> value*(256**$hash[key])

end

h1 = { :red => 0, :green => 0, :blue =>255}
print "#{entero_rgb(h1)}\n"
h2 = { :red => 128, :green => 125, :blue =>255}
print "#{entero_rgb(h2)}\n"


