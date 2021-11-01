class PlayerManager
    attr_reader :player1

    def initialize(marker)
        @marker = marker
    end

    def set_players(marker, player)
        if player == HUMAN_PLAYER
            @player1 = Human.new(1, marker, HUMAN_PLAYER)
        elsif player == COMPUTER_PLAYER
            @player1 = Computer.new(1, marker, COMPUTER_PLAYER)
        end
    end

    def get_move(player, board)
        player.get_move(board)
    end
end
