require 'bundler'
Bundler.require
require 'octokit'
Octokit.default_media_type = "application/vnd.github.beta+json"

Octokit.configure {|c|  c.login="jonathanloscalzo"; c.password = "xxxxxx"}

user = Octokit.repo 'TTPS-ruby/capacitacion-ruby-ttps'

resp = user.rels[:contributors].get.data.map{|e| puts %Q[ #{e.login} + #{e.contributions }]}

puts resp
