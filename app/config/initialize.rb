require_relative './environment'

require 'sinatra'
require 'redcarpet'
require 'yaml'
require 'securerandom'
require 'fileutils'

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

require_relative '../helpers/dummy'
require_relative '../helpers/definitions'
require_relative '../helpers/iotas'

require_relative '../routes/index'
require_relative '../routes/api'
require_relative '../routes/iota'
require_relative '../routes/collection'