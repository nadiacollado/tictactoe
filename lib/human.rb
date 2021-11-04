class Human < Player
    attr_accessor :id, :marker, :type

    def initialize(id, marker, type)
        @id = id
        @marker = marker
        @type = type
    end

    def get_move(board)
        gets.chomp.to_i
    end
end