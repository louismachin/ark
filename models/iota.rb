class Iota
    attr_reader :title, :description, :tags, :type, :created_at, :metadata

    def initialize(title:, description:, tags:, type:, created_at:, metadata: {})
        @title       = title
        @description = description
        @tags        = tags
        @type        = type
        @created_at  = created_at
        @metadata    = metadata
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