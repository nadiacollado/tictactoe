class Player
    attr_accessor :player_num, :symbol

    def initialize(player_num, symbol)
        @player_num = player_num
        @symbol = symbol
    end

    def get_move
        puts "Player #{symbol}, you're up!\n"
        gets.chomp.to_i
    end
end