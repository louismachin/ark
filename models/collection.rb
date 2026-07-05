class Collection
    COLLECTION_PATH = File.join(DATA_PATH, 'collections')

    attr_reader :id, :title, :description, :tags, :created_at, :metadata, :iota_ids

    def initialize(title:, description:, tags:, created_at:, metadata: {}, iota_ids: [], id: nil)
        @id          = id || SecureRandom.hex(8)
        @title       = title
        @description = description
        @tags        = tags
        @created_at  = created_at
        @metadata    = metadata
    end

    def to_hash
        {
            'id'          => id,
            'title'       => title,
            'description' => description,
            'tags'        => tags,
            'created_at'  => created_at,
            'metadata'    => metadata,
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
            title:       hash['title'],
            description: hash['description'],
            tags:        hash['tags'] || [],
            created_at:  hash['created_at'],
            metadata:    hash['metadata'] || {},
        )
    end

    def iotas
        @iotas ||= get_iotas.select { |iota| iota.collection_ids.include?(self.id) }
    end

    def size
        self.iotas.size
    end
end