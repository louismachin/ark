require 'sinatra'
require 'redcarpet'

APP_ROOT = File.expand_path('..', __dir__)

configure do
    set :bind, '0.0.0.0'
    set :port, '9393'
    set :views, File.join(APP_ROOT, 'views')
    set :public_folder, File.join(APP_ROOT, 'public')
    set :environment, :production if false
    disable :protection
end

require_relative '../models/iota'
require_relative '../models/collection'

require_relative '../routes/index'