=begin

Definir un método #tag que se comporte de 
manera similar a la clase HTMLCanvas utilizada en el 
framework web Seaside (smalltalk) para generar dinámicamente HTML. 
Debe funcionar de la siguiente manera:

=end
def tag(htmlTag, **attrs)
   content = (block_given?)? yield: ""
	props = attrs.inject("") { |acum, (k,v) | acum += " #{k} =\"#{v}\" "}
	"<#{htmlTag} #{props}>" +content+ "</#{htmlTag}>" 
end

# permite crear tags sin contenido:
tag(:input) #=> "<input>"
# permite setear attributos:
tag(:div, id: 'notification_panel', class: 'alert alert-danger') 
#=> <div id="notification_panel" class="alert alert-danger">

=begin
# permite setear attributos data-* de html5
tag(:input, id: 'id', data: { field: 'value' }) 
#=> <input id="id" data-field="value">

# permite crear tags con contenido. El contenido será obtenido de un bloque
tag(:div) { "esto es contenido" } #=> <div>esto es contenido</div>

# De esta manera se puede anidar tags, por ejemplo:
tag(:div, id: 'lista', data: { toogle: 'true' }) do
  tag(:ul) do
    tag(:li) { 'un item en una lista'}
  end
end
#=> <div id="lista" data-toggle="true"><ul><li> un item en una lista</li></ul></div>
=end

=begin
	
a. Esta solución permite utilizar todas las clases ruby y sus métodos 
para generar dinámicamente partes del html. 
Cómo la usaría para que a partir del siguiente hash:

menu = { google: 'http://google.com', ebay: 'http://ebay.com', facultad: 'http://info.unlp.edu.ar' }
Genere una lista de links como la siguiente:

<div>
  <ul>
    <li><a href="http://google.com"> Google </a></li>
    <li><a href="http://ebay.com"> Ebay </a></li>
    <li><a href="http://info.unlp.edu.ar"> Facultad </a></li>
  </ul>
</div>	

tag(:div) do
	tag(:ul) do
		menu.each do | k,v | 
			tag(:li) do
				tag(:a, href: v) { k.capitalize }
			end
		end 
	end
end
=end