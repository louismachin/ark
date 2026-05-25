get '/' do
    @collections = Array.new(3) { Collection.new }
    @iotas = Array.new(10) { Iota.new }
    erb :index
end

get '/search' do
    query = params['q']
    puts "query=#{query}"
    @collections = Array.new(3) { Collection.new }
    @iotas = Array.new(10) { Iota.new }
    erb :index
end