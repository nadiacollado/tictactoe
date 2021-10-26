require_relative 'board'
require_relative 'player'
require_relative 'rules'

class Game
    attr_reader :board, :marker, :rules, :player1, :player2

    def initialize
        @board = Board.new
        @rules = Rules.new
        @marker = Marker.new
        # @display = TicTacToe.new(board)
        @player1 = Player.new(1, marker.p1_marker)
        @player2 = Player.new(2, marker.p2_marker)
    end

    def get_current_player
        board.turn_count.odd? ? player2 : player1
    end

    def turn
        move = get_current_player.get_move
        board.valid_move?(move, get_current_player.marker)
    end

    def setup_game

    end

    def play
        until rules.game_over?(board)
            turn
            board.display_board

            if rules.won?(board)
                puts "Player #{rules.winner(board)} has won this round!"
            elsif rules.draw?(board)
                puts "It's a draw! Better luck next time."
            end 
        end
    end
end

