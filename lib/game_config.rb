class GameConfig
    attr_accessor :board, :marker, :game, :player1, :player2, :display, :strategy, :player_mode, :player_order

    def initialize
        @board = Board.new
        @marker = Markers.new
        @display = Display.new(board)
        @game = nil
        @strategy = nil
        @player_mode = nil
        @player_order = nil
    end

    def create_game
        set_game
        build_players
        @game = Game.new(board, player1, player2, display)
        start_game
    end

    def set_game
        @player_mode = single_player?
        if player_mode
            display.print_computer_mode_prompt
            @strategy = strategy_selection(display.get_computer_mode)
        end
        @player_order = player_order_selection
    end

    def start_game
        display.print_board(board)
        @game.play
    end
    
    def strategy_selection(computer_mode)
        computer_mode ? EasyStrategy.new : AdvancedStrategy.new
    end

    def build_players
        player_mode ? single_player_builder : multi_player_builder
    end

    private

    def single_player?
        display.get_player_mode 
    end

    def player_order_selection
        display.print_order_selection_prompt
        display.get_player_order
    end

    def multi_player_builder
        @player1 = Human.new(1, marker.p1)
        @player2 = Human.new(2, marker.p2)
    end

    def single_player_builder
        if player_order
            @player1 = Human.new(1, marker.p1)
            @player2 = Computer.new(2, marker.p2, strategy)
        else
            @player1 = Computer.new(1, marker.p1, strategy)
            @player2 = Human.new(2, marker.p2)
        end
    end
end
