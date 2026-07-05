get '/' do
    @collections = get_collections
    @iotas = get_iotas
    erb :index
end

not_found do
    redirect '/'
end

get '/iotas/new' do
    @collections = get_collections
    @iotas = get_iotas
    erb :iota_edit
end

get '/collections/new' do
    @collections = get_collections
    @iotas = get_iotas
    erb :collection_edit
end

get '/search' do
    query = params['q']
    puts "query=#{query}"
    @collections = get_collections
    @iotas = get_iotas
    erb :index
end
 
post '/iotas/new' do
    iota_params = params[:iota] || {}
 
    tags = (iota_params[:tags] || '').split(',').map(&:strip).reject(&:empty?)
 
    keys = Array(iota_params[:metadata_keys])
    values = Array(iota_params[:metadata_values])
    metadata = keys.zip(values).each_with_object({}) do |(k, v), hash|
        next if k.nil? || k.strip.empty?
        hash[k.strip] = v.to_s.strip
    end

    created_at = iota_params[:created_at]
    created_at = Date.today.to_s if created_at == nil || created_at == ''
 
    iota = Iota.new(
        title:       iota_params[:title],
        description: iota_params[:description],
        tags:        tags,
        type:        iota_params[:type],
        created_at:  created_at,
        metadata:    metadata
    )

    iota.save

    puts iota.inspect
 
    # TODO: persist `iota` somewhere (file, DB, in-memory store, etc.)
    # TODO: handle iota_params[:attachment] (a Sinatra file upload hash
    #       with :tempfile, :filename, :type) if present
 
    redirect '/'
end

post '/collections/new' do
    collection_params = params[:collection] || {}
 
    tags = (collection_params[:tags] || '').split(',').map(&:strip).reject(&:empty?)
 
    keys = Array(collection_params[:metadata_keys])
    values = Array(collection_params[:metadata_values])
    metadata = keys.zip(values).each_with_object({}) do |(k, v), hash|
        next if k.nil? || k.strip.empty?
        hash[k.strip] = v.to_s.strip
    end

    created_at = collection_params[:created_at]
    created_at = Date.today.to_s if created_at == nil || created_at == ''
 
    collection = Collection.new(
        title:       collection_params[:title],
        description: collection_params[:description],
        tags:        tags,
        created_at:  created_at,
        metadata:    metadata
    )

    collection.save

    puts collection.inspect

    redirect '/'
end
