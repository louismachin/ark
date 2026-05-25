class Iota
    attr_reader :title, :description, :tags, :type, :created_at

    def initialize
        @title = 'Example Entry Title'
        @description = 'A short description or excerpt associated with this entry. Can be a note, a transcription, a caption, or left empty.'
        @tags = ['archive', 'material', 'found']
        @type = 'object'
        @created_at = '2024-03-12'
    end
end