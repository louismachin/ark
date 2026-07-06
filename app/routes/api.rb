get '/api/iotas.json' do
    content_type :json
    get_iotas.map(&:to_hash).to_json
end

get '/api/iotas/:iota_id.json' do
    content_type :json
    iota = find_iota_by_id(params[:iota_id])
    if iota
        iota.to_hash.to_json
    else
        status 404
        nil
    end
end

get '/api/collections.json' do
    content_type :json
    get_collections.map(&:to_hash).to_json
end

get '/api/collections/:collection_id.json' do
    content_type :json
    collection = find_collection_by_id(params[:collection_id])
    if collection
        collection.to_hash.to_json
    else
        status 404
        nil
    end
end