class Player
    attr_accessor :id, :marker

    def initialize(id, marker)
        @id = id
        @marker = marker
    end

    def get_move
        gets.chomp.to_i
    end
end