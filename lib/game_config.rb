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
        strategy = display.get_computer_type ? EasyStrategy.new : AdvancedStrategy.new
    end

    def player_order_selection(opponent_selection)
        if !opponent_selection
            strategy = computer_selection
            display.print_order_selection_prompt
            single_player_order_selection(display.get_order_selection, strategy)
        else
            display.print_order_selection_prompt
            multi_player_order_selection(display.get_order_selection)
        end
    end

    def multi_player_order_selection(order)
        if order == PLAYER_ONE
            @player1 = Human.new(1, marker.p1_marker, HUMAN_PLAYER)
            @player2 = Human.new(2, marker.p2_marker, HUMAN_PLAYER)
        else
            @player1 = Human.new(2, marker.p2_marker, HUMAN_PLAYER)
            @player2 = Human.new(1, marker.p1_marker, HUMAN_PLAYER)
        end
    end

    def single_player_order_selection(order, strategy)
        if order == PLAYER_ONE
            @player1 = Human.new(1, marker.p1_marker, HUMAN_PLAYER)
            @player2 = Computer.new(2, marker.p2_marker, strategy)
        else
            @player1 = Computer.new(1, marker.p1_marker, strategy)
            @player2 = Human.new(2, marker.p2_marker, HUMAN_PLAYER)
        end
    end

    def build_players
        # opponent_selection = humans_only ? multi_player_order_selection : computer_selection
        player_order_selection(humans_only?)
    end
end
