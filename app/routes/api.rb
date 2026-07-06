get '/api/iotas.json' do
    content_type :json
    get_iotas.map(&:to_hash).to_json
end