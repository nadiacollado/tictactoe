class Player
    attr_reader :id, :marker, :type
    
    def initialize(id, marker, type)
        @id = id
        @marker = marker
        @type = type
    end
end
