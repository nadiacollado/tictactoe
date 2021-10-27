require_relative 'game'

class GameConfig
    attr_accessor :board, :marker, :game, :player1, :player2, :display

    def initialize
        @game = game
        @board = Board.new
        @marker = Marker.new
        @display = Display.new(board)
    end

    def create_game
        configure_players
        @game = Game.new(board, player1, player2)
        start_game
    end

    def start_game
        board.display_board
        @game.play
    end

    def humans_only?
        display.get_player_type == "H" ? true : false
    end

    def configure_players
        if humans_only?
            @player1 = Player.new(1, marker.p1_marker)
            @player2 = Player.new(2, marker.p2_marker)
        end
    end
end
