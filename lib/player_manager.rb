class PlayerManager

    attr_reader :player1

    def set_players(marker, player_type)
        if player_type == "H"
            @player1 = Player.new(1, marker)
        end
    end
end
