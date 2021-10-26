class Player
    attr_accessor :id, :marker

    def initialize(id, marker)
        @id = id
        @marker = marker
    end

    def get_move
        puts "Player #{marker}, you're up!\n"
        gets.chomp.to_i
    end
end