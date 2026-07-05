class Collection
    COLLECTION_PATH = File.join(DATA_PATH, 'collections')

    attr_reader :id, :name, :description, :tags, :created_at, :metadata, :iota_ids

    def initialize(name:, description:, tags:, created_at:, metadata: {}, iota_ids: [], id: nil)
        @id          = id || SecureRandom.hex(8)
        @name        = name
        @description = description
        @tags        = tags
        @created_at  = created_at
        @metadata    = metadata
        @iota_ids    = iota_ids
    end

    def to_hash
        {
            'id'          => id,
            'name'        => name,
            'description' => description,
            'tags'        => tags,
            'created_at'  => created_at,
            'metadata'    => metadata,
            'iota_ids'    => iota_ids,
        }
    end

    def save
        FileUtils.mkdir_p(COLLECTION_PATH)
        File.write(path, to_hash.to_yaml)
        clear_collection_cache
        self
    end

    def path
        File.join(COLLECTION_PATH, "#{id}.yml")
    end

    def self.from_hash(hash)
        new(
            id:          hash['id'],
            name:        hash['name'],
            description: hash['description'],
            tags:        hash['tags'] || [],
            created_at:  hash['created_at'],
            metadata:    hash['metadata'] || {},
            iota_ids:    hash['iota_ids'] || [],
        )
    end

    def iotas
        @iotas ||= @iota_ids.map { |iota_id| find_iota_by_id(iota_id) }.compact
    end

    def size
        @iota_ids.size
    end
end