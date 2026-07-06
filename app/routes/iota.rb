get '/iotas' do
    @page = 'Iotas'
    @title = 'All Entries'
    @iotas = get_iotas.clone
    if params[:tag]
        @iotas.select! { |i| i.tags.include?(params[:tag]) }
        @title = params[:tag]
    end
    if params[:type]
        @iotas.select! { |i| i.type == params[:type] }
        @title = PLURAL_IOTA_TYPE_LABELS[params[:type]]
        @page = PLURAL_IOTA_TYPE_LABELS[params[:type]]
    end
    if params[:q]
        @iotas.select! { |i| i.match?(params[:q]) }
        @title = "Search \"#{params[:q]}\""
    end
    erb :iotas
end

get '/iotas/new' do
    erb :iota_edit
end

get '/iotas/:iota_id' do
    @iota = find_iota_by_id(params[:iota_id])
    halt 404 unless @iota
    erb :iota
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

    collection_ids = iota_params[:collection_id] ? [iota_params[:collection_id]] : []

    created_at = iota_params[:created_at]
    created_at = Date.today.to_s if created_at == nil || created_at == ''
 
    iota = Iota.new(
        title:          iota_params[:title],
        description:    iota_params[:description],
        tags:           tags,
        type:           iota_params[:type],
        created_at:     created_at,
        metadata:       metadata,
        collection_ids: collection_ids,
    )

    iota.save
 
    # TODO: persist `iota` somewhere (file, DB, in-memory store, etc.)
    # TODO: handle iota_params[:attachment] (a Sinatra file upload hash
    #       with :tempfile, :filename, :type) if present

    redirect '/'
end