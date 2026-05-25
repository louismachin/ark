require_relative './environment'

require 'sinatra'
require 'redcarpet'

configure do
    set :bind, '0.0.0.0'
    set :port, APP_PORT
    set :views, VIEWS_PATH
    set :public_folder, PUBLIC_PATH
    set :environment, :production if false
    disable :protection
end

require_relative '../models/iota'
require_relative '../models/collection'

require_relative '../routes/index'