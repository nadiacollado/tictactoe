require_relative 'game'

class GameConfig
    attr_reader :board, :marker, :game, :player1, :player2

    def initialize
        @board = Board.new
        @marker = Marker.new
        @display = Display.new(board)
    end

    def create_game
        configure_players(get_player_type)
        @game = Game.new(board, player1, player2)
        start_game
    end

    def start_game
        @game.play
    end

    def get_player_type
        gets.chomp
    end

    def configure_players(player_type)
        if player_type == "H"
            @player1 = Player.new(1, marker.p1_marker)
            @player2 = Player.new(2, marker.p2_marker)
        end
    end
end
