$iota_cache = nil

def get_iotas
    return $iota_cache if $iota_cache

    FileUtils.mkdir_p(Iota::IOTA_PATH)

    $iota_cache = Dir.glob(File.join(Iota::IOTA_PATH, '*.yml')).map do |file|
        Iota.from_hash(YAML.load_file(file))
    end
end

def get_recent_iotas(n = 5)
    get_iotas.sort_by(&:created_at).last(n)
end

def clear_iota_cache
    $iota_cache = nil
end

def find_iota_by_id(id)
    for iota in get_iotas do
        return iota if iota.id == id
    end
    return nil
end

$collection_cache = nil

def get_collections
    return $collection_cache if $collection_cache

    FileUtils.mkdir_p(Collection::COLLECTION_PATH)

    $collection_cache = Dir.glob(File.join(Collection::COLLECTION_PATH, '*.yml')).map do |file|
        Collection.from_hash(YAML.load_file(file))
    end
end

def clear_collection_cache
    $collection_cache = nil
end