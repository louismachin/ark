get '/collections' do
    erb :collections
end

get '/collections/new' do
    protect!
    erb :collection_edit
end

post '/collections/new' do
    protect!
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

    collection.save!

    redirect '/'
end

get '/collections/:collection_id' do
    @collection = find_collection_by_id(params[:collection_id])
    halt 404 unless @collection
    erb :collection
end