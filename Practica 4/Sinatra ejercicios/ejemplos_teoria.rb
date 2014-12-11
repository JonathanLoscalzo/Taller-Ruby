require 'bundler'
Bundler.require

get '/' do
  'This is GET'
end

post '/' do
  'This is POST'
end

put '/' do
  'This is PUT'
end

patch '/' do
  'This is PATCH'
end

delete '/' do
  'This is DELETE'
end

=begin

$ curl -X GET http://localhost:4567/
This is GET
$ curl -d '' -X PUT http://localhost:4567/ 
This is PUT
$ curl -d '' -X POST http://localhost:4567/ 
This is POST
$ curl -d '' -X DELETE http://localhost:4567/ 
This is DELETE
$ curl -d '' -X PATCH http://localhost:4567/ 
This is PATCH	
	
=end
#_____________________________________________________________

#rutas con params 

get '/hello/:name' do
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params[:name] is 'foo' or 'bar'
    "Hello #{params[:name]}!"
end

# O usando variables de bloque
get '/hello/:name' do |n|
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params[:name] is 'foo' or 'bar'
    # n stores params[:name] => mejor! 
    "Hello #{n}!"
end
#_____________________________________________________________

#Rutas con splat. splat machea todo "string"

get '/say/*/to/*' do
    # matches /say/hello/to/world
    params[:splat] # => ["hello", "world"]
end

get '/download/*.*' do
    # matches /download/path/to/file.xml => engañoso esto!
    params[:splat] # => ["path/to/file", "xml"]
end

# O usando variales de bloque, se le agrega a cada uno el valor
get '/download/*.*' do |path, ext|
    [path, ext] # => ["path/to/file", "xml"]
end

#_____________________________________________________________

#patrones con regexp

get %r{/hello/([\w]+)} do
    "Hello, #{params[:captures].first}!"
end

# O usando variables de bloque
get %r{/hello/([\w]+)} do |c|
    "Hello, #{c}!"
end

#_____________________________________________________________

#CON PARAMETROS POR CONSULTA ? & & & ...

get '/posts' do
    # matches "GET /posts?title=foo&author=bar"
    title = params[:title]
    author = params[:author]
end

=begin
	
Las rutas de sinatra pueden incluir condiciones de match como por ejemplo:

    agent: condiciones sobre el UA
    provides: condiciones sobre el content type
    host_name: condiciones sobre el server name
    definidas por el usuario
Para probarlos : 
curl http://localhost:4567/foo -A 'Songbird 1.1'
curl http://localhost:4567 -H "Accept: application/xml"
	
=end

get '/foo', :agent => /Songbird (\d\.\d)[\d\/]*?/ do
    "You're using Songbird version #{params[:agent][0]}"
end

get '/foo' do
    # Matches non-songbird browsers
end


get '/', :host_name => /^admin\./ do
    "Admin Area, Access denied!"
end

get '/', :provides => 'html' do
    'HTML'
end

get '/', :provides => ['rss', 'atom', 'xml'] do
    'XML'
end	

#CONDICIONES PROPIAS :) ?
#http://www.sinatrarb.com/intro.html#Conditions
set(:probability) do |value| 
    condition { rand <= value }
end

get '/win_a_car', :probability => 0.1 do
    "You won!"
end

get '/win_a_car' do
    "Sorry, you lost."
end

set(:auth) do |*roles|   # <- notice the splat here
    condition do
        unless logged_in? && 
            roles.any? {|role| current_user.in_role? role }
                redirect "/login/", 303
        end
    end
end

get "/my/account/", :auth => [:user, :admin] do
    "Your Account Details"
end

get "/only/admin/", :auth => :admin do
    "Only admins are allowed here!"
end
