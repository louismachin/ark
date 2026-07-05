class Iota
    IOTA_PATH = File.join(DATA_PATH, 'iotas')

    attr_reader :id, :title, :description, :tags, :type, :created_at, :metadata

    def initialize(title:, description:, tags:, type:, created_at:, metadata: {}, id: nil)
        @id          = id || SecureRandom.hex(8)
        @title       = title
        @description = description
        @tags        = tags
        @type        = type
        @created_at  = created_at
        @metadata    = metadata
    end

    def to_hash
        {
            'id'          => id,
            'title'       => title,
            'description' => description,
            'tags'        => tags,
            'type'        => type,
            'created_at'  => created_at,
            'metadata'    => metadata
        }
    end

    def save
        FileUtils.mkdir_p(IOTA_PATH)
        File.write(path, to_hash.to_yaml)
        clear_iota_cache
        self
    end

    def path
        File.join(IOTA_PATH, "#{id}.yml")
    end

    def self.from_hash(hash)
        new(
            id:          hash['id'],
            title:       hash['title'],
            description: hash['description'],
            tags:        hash['tags'] || [],
            type:        hash['type'],
            created_at:  hash['created_at'],
            metadata:    hash['metadata'] || {}
        )
    end

    def object?
        @type == 'object'
    end

    def picture?
        @type == 'picture'
    end

    def writing?
        @type == 'writing'
    end
end