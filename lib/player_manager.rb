class PlayerManager

    attr_reader :player1

    def initialize(marker)
        @marker = marker
    end

    def set_players(marker, player)
        if player == "H"
            @player1 = Player.new(1, marker, "human")
        elsif player == "C"
            @player1 = Computer.new(1, marker, "computer")
        end
    end
end
