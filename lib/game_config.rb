class GameConfig
    attr_reader :board, :marker, :game, :player1, :player2, :display

    def initialize
        @board = Board.new
        @marker = Marker.new
        @display = Display.new(board)
        @game = nil
    end

    def create_game
        build_players
        @game = Game.new(board, player1, player2, display)
        start_game
    end

    def start_game
        display.print_board(board)
        @game.play
    end
    
    def humans_only?
        display.get_player_type == HUMAN_PLAYER ? true : false
    end
    
    def computer_selection
        display.print_computer_type_prompt
        if display.get_computer_type == EASY_COMPUTER
            strategy = EasyStrategy.new
        else
            strategy = AdvancedStrategy.new
        end
        Computer.new(1, marker.p1_marker, strategy)
    end

    def build_players
        @player1 = humans_only? ? Human.new(1, marker.p1_marker, HUMAN_PLAYER) : computer_selection
        @player2 = Human.new(2, marker.p2_marker, HUMAN_PLAYER)
    end
end
