require 'bundler'
Bundler.require
require 'octokit'
Octokit.default_media_type = "application/vnd.github.beta+json"

Octokit.configure {|c|  c.login="jonathanloscalzo"; c.password = "xxxxxx"}

user = Octokit.repo 'TTPS-ruby/capacitacion-ruby-ttps'

resp = user.rels[:contributors].get.data.map{|e| puts %Q[ #{e.login} => #{e.contributions }]}

puts resp

=begin

	Analizando el proyecto creado para el ejercicio anterior, analizá:

a - ¿En qué archivo se guardan las versiones de las gemas instaladas por bundler?

/home/loscalzo/.rbenv/versions/2.1.3/lib/ruby/gems/2.1.0/gems/octokit-3.5.2

b - ¿Qué versión de octokit se utiliza al ejecutar con bundle exec?
octokit (3.5.2) (esta en el gemlock)

c - Modificá el Gemfile de tu proyecto para que dependa de octokit 2.4.0 y ejecutá bundle install. 
¿En qué archivo se refleja el cambio de versión luego de instalar (además del Gemfile)?
En el gemfile.lock?
ctokit (2.4.0)

/home/loscalzo/.rbenv/versions/2.1.3/lib/ruby/gems/2.1.0/gems/octokit-2.4.0

d - Ejecutá gem search -l octokit para ver las versiones de octokit instaladas.

/home/loscalzo/.rbenv/versions/2.1.3/lib/ruby/gems/2.1.0/gems/octokit-2.4.0

e - Ejecutá bundle install --deployment, investiguá los contenidos del directorio vendor y el directorio .bundler 
creados por este comando. ¿Para qué puede servir ese comando?

Install all dependencies on to a production server. Do not use this flag on a development machine.
The --deployment flag activates a number of deployment-friendly conventions:

Isolate all gems into vendor/bundle
Require an up-to-date Gemfile.lock
If bundle package was run, do not fetch gems from rubygems.org. Instead, only use gems in the checked in vendor/cache

f - Leé las recomendaciones de la página de bundler en la sección Deploying sobre qué archivos 
es recomendable versionar y cuales no.

Before deploying an app that uses Bundler, Add your Gemfile 
and Gemfile.lock to source control, but ignore the .bundle folder, which is specific to each machine.

$ echo ".bundle\n" >> .gitignore
$ git add Gemfile Gemfile.lock .gitignore
$ git commit -m "Add Bundler support"

Once you have done that, there are two ways to deploy using Bundler: manually or automatically.

Manual deployment
In your deploy script, after updating to the latest code, 
install your bundle to the vendor/bundle directory, ensuring all your dependencies are met.
$ bundle install --deployment
Start your application servers as usual, and your application will 
use your bundled environment with the exact same gems you use in development.
If you have run -bundle package-, the cached gems will be used automatically.
http://bundler.io/v1.7/deploying.html


=end