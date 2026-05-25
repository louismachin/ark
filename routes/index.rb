get '/' do
    @collections = Array.new(3) { Collection.new }
    @iotas = Array.new(10) { Iota.new }
    erb :index
end