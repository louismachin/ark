get '/' do
    @collections = Array.new(3) { Collection.new }
    @iotas = get_dummy_iotas
    erb :index
end

get '/entry/new' do
    @collections = Array.new(3) { Collection.new }
    @iotas = get_dummy_iotas
    erb :entry_edit
end

get '/search' do
    query = params['q']
    puts "query=#{query}"
    @collections = Array.new(3) { Collection.new }
    @iotas = get_dummy_iotas
    erb :index
end
 
post '/iotas/new' do
    iota_params = params[:iota] || {}
 
    tags = (iota_params[:tags] || '').split(',').map(&:strip).reject(&:empty?)
 
    keys   = Array(iota_params[:metadata_keys])
    values = Array(iota_params[:metadata_values])
    metadata = keys.zip(values).each_with_object({}) do |(k, v), hash|
        next if k.nil? || k.strip.empty?
        hash[k.strip] = v.to_s.strip
    end
 
    iota = Iota.new(
        title:       iota_params[:title],
        description: iota_params[:description],
        tags:        tags,
        type:        iota_params[:type],
        created_at:  iota_params[:created_at],
        metadata:    metadata
    )
 
    # TODO: persist `iota` somewhere (file, DB, in-memory store, etc.)
    # TODO: handle iota_params[:attachment] (a Sinatra file upload hash
    #       with :tempfile, :filename, :type) if present
 
    redirect '/iotas'
end
