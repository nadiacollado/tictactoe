class Player
    attr_accessor :id, :marker

    def initialize(id, marker)
        @id = id
        @marker = marker
    end

    # should this get moved to the Display class?
    def get_move
        gets.chomp.to_i
    end
end