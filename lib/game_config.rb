class GameConfig
    attr_reader :board, :marker, :game, :player1, :player2, :display, :manager

    def initialize
        @board = Board.new
        @marker = Marker.new
        @display = Display.new(board)
        @manager = PlayerManager.new(marker)
        @player2 = Human.new(2, marker.p2_marker, HUMAN_PLAYER)
        @game = nil
    end

    def create_game
        configure_players
        @game = Game.new(board, player1, player2, display, manager)
        start_game
    end

    def start_game
        display.print_board(board)
        @game.play
    end
    
    def humans_only?
        display.get_player_type == HUMAN_PLAYER ? true : false
    end

    # def humans_only?
    #     if display.get_player_type == HUMAN_PLAYER 
    #         true
    #     elsif display.get_player_type == COMPUTER_PLAYER
    #         false
    #     else
    #         display.print(INVALID_SELECTION)
    #     end
    # end

    #BUG: will create a computer based game with any entry that is not "H"
    def configure_players
        if humans_only?
            @player1 = manager.set_players(marker.p1_marker, HUMAN_PLAYER)
        else
            @player1 = manager.set_players(marker.p1_marker, COMPUTER_PLAYER)
        end
    end
end
