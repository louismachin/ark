def get_iotas
    return $iota_cache if $iota_cache

    FileUtils.mkdir_p(Iota::IOTA_PATH)

    $iota_cache = Dir.glob(File.join(Iota::IOTA_PATH, '*.yml')).map { |file|
        iota = Iota.from_hash(YAML.load_file(file))
        $object_count  += 1 if iota.object?
        $writing_count += 1 if iota.writing?
        $picture_count += 1 if iota.picture?
        $other_count   += 1 if iota.other?
        iota.deleted? ? nil : iota
    }.compact.sort_by(&:created_at).reverse * 10
end

def get_deleted_iotas
    return $deleted_iota_cache if $deleted_iota_cache

    FileUtils.mkdir_p(Iota::IOTA_PATH)

    $deleted_iota_cache = Dir.glob(File.join(Iota::IOTA_PATH, '*.yml')).map { |file|
        iota = Iota.from_hash(YAML.load_file(file))
        iota.deleted? ? iota : nil
    }.compact.sort_by(&:created_at)
end

def get_recent_iotas(n = 5)
    get_iotas.sort_by(&:created_at).reverse.first(n)
end

def get_iota_counts
    {
        'All types' => get_iotas.size,
        'Objects'   => $object_count,
        'Writings'  => $writing_count,
        'Pictures'  => $picture_count,
        'Other'     => $other_count,
    }
end

def find_iota_by_id(id)
    return nil if id == nil
    get_iotas.each { |i| return i if i.id == id || i.key == id }
    return nil
end

def get_tags
    return $tag_cache if $tag_cache

    $tag_cache = get_iotas.map(&:tags).flatten.uniq.sort
end
    