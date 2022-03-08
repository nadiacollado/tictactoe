class GameConfig
    attr_reader :board, :marker, :game, :player1, :player2, :display

    def initialize
        @board = Board.new
        @marker = Markers.new
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
    
    def single_player?
        display.get_player_mode 
    end
    
    def strategy_selection
        display.print_computer_mode_prompt
        strategy = display.get_computer_mode ? EasyStrategy.new : AdvancedStrategy.new
    end

    def player_order_selection(player_mode)
        if player_mode 
            strategy = strategy_selection
            display.print_order_selection_prompt
            single_player_builder(display.get_player_order, strategy)
        else
            display.print_order_selection_prompt
            display.get_player_order
            multi_player_builder
        end
    end

    def multi_player_builder
        @player1 = Human.new(1, marker.p1)
        @player2 = Human.new(2, marker.p2)
    end

    def single_player_builder(order, strategy)
        if order
            @player1 = Human.new(1, marker.p1)
            @player2 = Computer.new(2, marker.p2, strategy)
        else
            @player1 = Computer.new(1, marker.p1, strategy)
            @player2 = Human.new(2, marker.p2)
        end
    end

    def build_players
        player_order_selection(single_player?)
    end
end
