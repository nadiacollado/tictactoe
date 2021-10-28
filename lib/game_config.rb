require_relative 'game'

class GameConfig
    attr_reader :board, :marker, :game, :player1, :player2, :display, :manager

    def initialize
        @board = Board.new
        @marker = Marker.new
        @display = Display.new(board)
        @manager = PlayerManager.new(marker)
        @game = nil
    end

    def create_game
        configure_players
        @game = Game.new(board, player1, Player.new(2, marker.p2_marker, "H"), display)
        start_game
    end

    def start_game
        display.print_board(board)
        @game.play
    end

    def humans_only?
        display.get_player_type == "H" ? true : false
    end

    def configure_players
        if humans_only?
            @player1 = manager.set_players(marker.p1_marker, "H")
        else
            @player1 = manager.set_players(marker.p1_marker, "C")
        end
    end
end
