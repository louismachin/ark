class Iota
    IOTA_PATH = File.join(DATA_PATH, 'iotas')

    attr_reader :id, :title, :description, :tags, :type, :created_at, :metadata, :collection_ids

    def initialize(title:, description:, tags:, type:, created_at:, metadata: {}, collection_ids: [], id: nil)
        @id             = id || SecureRandom.hex(8)
        @title          = title
        @description    = description
        @tags           = tags
        @type           = type
        @created_at     = created_at
        @metadata       = metadata
        @collection_ids = collection_ids
    end

    def to_hash
        {
            'id'             => id,
            'title'          => title,
            'description'    => description,
            'tags'           => tags,
            'type'           => type,
            'created_at'     => created_at,
            'metadata'       => metadata,
            'collection_ids' => collection_ids,
        }
    end

    def save
        FileUtils.mkdir_p(IOTA_PATH)
        File.write(path, to_hash.to_yaml)
        clear_cache
        self
    end

    def path
        File.join(IOTA_PATH, "#{id}.yml")
    end

    def self.from_hash(hash)
        new(
            id:             hash['id'],
            title:          hash['title'],
            description:    hash['description'],
            tags:           hash['tags'] || [],
            type:           hash['type'],
            created_at:     hash['created_at'],
            metadata:       hash['metadata'] || {},
            collection_ids: hash['collection_ids'] || [],
        )
    end

    def object?
        type == 'object'
    end

    def picture?
        type == 'picture'
    end

    def writing?
        type == 'writing'
    end

    def other?
        [self.object?, self.picture?, self.writing?].none?
    end

    def collection # assumes 1 collection
        return nil unless collection_ids
        find_collection_by_id(collection_ids.first)
    end

    def match?(query)
        ([@title, @description] + @tags).join(' ').include?(query)
    end
end