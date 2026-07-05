$iota_cache = nil

def get_iotas
    return $iota_cache if $iota_cache

    FileUtils.mkdir_p(Iota::IOTA_PATH)

    $iota_cache = Dir.glob(File.join(Iota::IOTA_PATH, '*.yml')).map do |file|
        Iota.from_hash(YAML.load_file(file))
    end
end

def clear_iota_cache
    $iota_cache = nil
end

def get_collections
    return []
end