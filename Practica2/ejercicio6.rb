=begin

Definir un método #tag que se comporte de 
manera similar a la clase HTMLCanvas utilizada en el 
framework web Seaside (smalltalk) para generar dinámicamente HTML. 
Debe funcionar de la siguiente manera:

el orden de precedencia de {} es mayor que el de do-end.
	Ademas puts tiene mayor precedencia que do-end
		In the first case, the block is passed to map, and everything works properly.
		In the second case, the block is passed to puts, which doesn't do anything with it.
		map doesn't receive a block and just returns an enumerator.


=end

def tag(htmlTag, **attrs)
	content = (block_given?)? yield : ""
	dataElements = (attrs.key?(:data))? attrs.delete(:data) : ""
	#muy bueno lo del ducktyping. Aqui no importa si es hash o string ambos entienden .empty?
	unless dataElements.empty?
		dataElements = dataElements.inject("") { |acum, (k,v)| acum + %Q[ data-#{k}="#{v}"] }
	end
	props = attrs.inject("") { |acum, (k,v) | acum + %Q[ #{k}="#{v}"]}
	"<#{htmlTag}#{props}#{dataElements}>" +content+ "</#{htmlTag}>" 
end

#segunda version.

def tag2(htmlTag, **attrs)
	dataElements = (attrs.key?(:data))? attrs.delete(:data) : {}
	dataElements = dataElements.inject("") { |acum, (k,v)| acum + %Q[ data-#{k}="#{v}"] } #si no hay nadie, no entra
	props = attrs.inject("") { |acum, (k,v) | acum + %Q[ #{k}="#{v}"]} #si no hay nadie, no entra
	"<#{htmlTag}#{props}#{dataElements}>" + ((block_given?)? yield : "")+ "</#{htmlTag}>" 
end

def tag3(name, **params)
#esto es de la facu
	data = params.delete(:data) { |k| Hash.new }
	par = ''
	par << ' ' << data.map { |k, v| %(data-#{k}="#{v}") }.join(' ') if data.any?
	par << ' ' << params.map { |k, v| %(#{k}="#{v}") }.join(' ') if params.any?
	"<#{name}#{par}>" << ((block_given?)? yield : "") << "</#{name}>" 
end

# permite crear tags sin contenido:
tag(:input) #=> "<input>"

# permite setear attributos:
a = tag(:div, id: 'notification_panel', class: 'alert alert-danger') 
puts a
#=> <div id="notification_panel" class="alert alert-danger">

# permite crear tags con contenido. El contenido será obtenido de un bloque
a = tag(:div) { "esto es contenido" } #=> <div>esto es contenido</div>
puts a
# De esta manera se puede anidar tags, por ejemplo:
a = tag(:div, id: 'lista') do
  tag(:ul) do
    tag(:li) { 'un item en una lista'}
  end
end
puts a
# permite setear attributos data-* de html5
a = tag(:input, id: 'id', data: { field: 'value' }) 
puts a
#=> <input id="id" data-field="value">

# De esta manera se puede anidar tags, por ejemplo:
tag(:div, id: 'lista', data: { toogle: 'true' }) do
  tag(:ul) do
    tag(:li) { 'un item en una lista'}
  end
end
#=> <div id="lista" data-toggle="true"><ul><li> un item en una lista</li></ul></div>
=begin	
________________________________________________________________________________________

a. Esta solución permite utilizar todas las clases ruby y sus métodos 
para generar dinámicamente partes del html. 
Cómo la usaría para que a partir del siguiente hash:

Genere una lista de links como la siguiente:

<div>
  <ul>
    <li><a href="http://google.com"> Google </a></li>
    <li><a href="http://ebay.com"> Ebay </a></li>
    <li><a href="http://info.unlp.edu.ar"> Facultad </a></li>
  </ul>
</div>	

=end
menu = { google: 'http://google.com', ebay: 'http://ebay.com', facultad: 'http://info.unlp.edu.ar' }
puts "====================================================================================="

b = tag2(:div) do
	"\n"+tag2(:ul, data: { toogle: 'true' }) do		
		menu.inject("") do |mem, (k,v)|  
			mem + "\n" + tag2(:li) { tag2(:a, href: v.to_s ) { k.to_s.capitalize } } 
		end + "\n"
	end +"\n"
end

a = tag(:div) do
	"\n"+tag(:ul, data: { toogle: 'true' }) do		
		menu.inject("") do |mem, (k,v)|  
			mem + "\n" + tag(:li) { tag(:a, href: v.to_s ) { k.to_s.capitalize } } 
		end + "\n"
	end +"\n"
end

c = tag3(:div) do
	"\n"+tag3(:ul, data: { toogle: 'true' }) do		
		menu.inject("") do |mem, (k,v)|  
			mem + "\n" + tag3(:li) { tag3(:a, href: v.to_s ) { k.to_s.capitalize } } 
		end + "\n"
	end +"\n"
end

puts a==b && b==c
puts a
puts b
puts c