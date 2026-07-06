def get_collections
    return $collection_cache if $collection_cache

    FileUtils.mkdir_p(Collection::COLLECTION_PATH)

    $collection_cache = Dir.glob(File.join(Collection::COLLECTION_PATH, '*.yml')).map do |file|
        Collection.from_hash(YAML.load_file(file))
    end
end

def find_collection_by_id(id)
    get_collections.each { |c| return c if c.id == id }
    return nil
end