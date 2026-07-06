def get_iotas
    return $iota_cache if $iota_cache

    FileUtils.mkdir_p(Iota::IOTA_PATH)

    $iota_cache = Dir.glob(File.join(Iota::IOTA_PATH, '*.yml')).map do |file|
        iota = Iota.from_hash(YAML.load_file(file))
        $object_count  += 1 if iota.object?
        $writing_count += 1 if iota.writing?
        $picture_count += 1 if iota.picture?
        $other_count   += 1 if iota.other?
        iota
    end
end

def get_recent_iotas(n = 5)
    get_iotas.sort_by(&:created_at).last(n)
end

def clear_cache
    $iota_cache       = nil
    $object_count     = 0
    $writing_count    = 0
    $picture_count    = 0
    $other_count      = 0
    $collection_cache = nil
end

clear_cache

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
    for iota in get_iotas do
        return iota if iota.id == id
    end
    return nil
end


def get_collections
    return $collection_cache if $collection_cache

    FileUtils.mkdir_p(Collection::COLLECTION_PATH)

    $collection_cache = Dir.glob(File.join(Collection::COLLECTION_PATH, '*.yml')).map do |file|
        Collection.from_hash(YAML.load_file(file))
    end
end

def find_collection_by_id(id)
    for collection in get_collections do
        return collection if collection.id == id
    end
    return nil
end

# Returns [[tag, css_class], ...] sorted alphabetically by tag.
# css_class is one of 'sm', nil (default size), 'lg', 'xl' based on
# how often the tag appears relative to the least/most common tag.

def get_tag_cloud
    counts = Hash.new(0)
 
    get_iotas.each do |iota|
        iota.tags.each { |tag| counts[tag] += 1 }
    end
 
    return [] if counts.empty?
 
    min_count, max_count = counts.values.min, counts.values.max

    counts.sort_by { |tag, _count| tag.downcase }.map do |tag, count|
        [tag, tag_cloud_class(count, min_count, max_count)]
    end
end
 
def tag_cloud_class(count, min_count, max_count)
    return nil if max_count == min_count
    ratio = (count - min_count).to_f / (max_count - min_count)
    if ratio >= 0.85
        'xl'
    elsif ratio >= 0.6
        'lg'
    elsif ratio < 0.25
        'sm'
    else
        nil
    end
end
 
