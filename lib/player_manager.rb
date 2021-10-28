class PlayerManager
    attr_reader :player1

    def initialize(marker)
        @marker = marker
    end

    def set_players(marker, player)
        if player == HUMAN_PLAYER
            @player1 = Player.new(1, marker, HUMAN_PLAYER)
        elsif player == COMPUTER_PLAYER
            @player1 = Computer.new(1, marker, COMPUTER_PLAYER)
        end
    end
end
