=begin
Implemente el método Movies.search que permitirá obtener la información de las películas buscadas en un Array de Hashes.
Para obtener la información deberá usar la API de http://www.omdbapi.com/.

El método search debe recibir 3 argumentos:

    title: el título de la película.
    year: el año de la película (keyword argument, por defecto debe buscar todos los años).
    http: el objeto que se usará para obtener la información, este objeto debe aceptar el método #get (keyword argument, por defecto Net::HTTP).

=end

require 'net/http'
require 'json'

class Movies

	def search(http = Net::HTTP, title: , year: )
		#   title: el título de la película.
		#	  year: el año de la película (keyword argument, por defecto debe buscar todos los años).
		#	  http: el objeto que se usará para obtener la información, este objeto debe aceptar el método #get (keyword argument, por defecto Net::HTTP).
#levanto excepciones en caso de que no funcionen
		raise TypeErrorException unless year.to_s =~ /^[0-9]*$/
		raise Exception unless http.instance_methods.include? :get #http.response_to? :get

#		Para hablar con la api, como mando los parametros
		uri = URI("http://www.imdbapi.com")
		params  = { :t => title.to_s, :y => year.to_s }
		uri.query = URI.encode_www_form(params)

#consulta y devuelvo en json
		res = http.get(uri)
		JSON.parse(res)
	end

end

a = Movies.new
print a.search(title: "spiderman", year: 2000)
print a.search(year: 2000, title: "spiderman")

