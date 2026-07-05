task :run do
  require_relative './config/initialize'
  Sinatra::Application.run!
end

task :no_run do
  require_relative './config/initialize'
# Sinatra::Application.run!
end

task :dummy do
  require_relative './config/initialize'
  get_dummy_iotas.each { |iota| iota.save }
  get_dummy_collections.each { |collection| collection.save }
# Sinatra::Application.run!
end