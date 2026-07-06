get '/api/iotas.json' do
    content_type :json
    get_iotas.map(&:to_hash).to_json
end

get '/api/iotas/:iota_id.json' do
    iota = find_iota_by_id(params[:iota_id])
    halt 404 unless iota
    content_type :json
    iota.to_hash.to_json
end

get '/api/collections.json' do
    content_type :json
    get_collections.map(&:to_hash).to_json
end

get '/api/collections/:collection_id.json' do
    collection = find_collection_by_id(params[:collection_id])
    halt 404 unless collection
    content_type :json
    collection.to_hash.to_json
end

get '/api/tags.json' do
    content_type :json
    get_tags.to_json
end