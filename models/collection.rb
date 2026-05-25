class Collection
    attr_reader :name

    def initialize
        @name = 'Example Collection'
    end

    def count
        return rand(1000)
    end
end