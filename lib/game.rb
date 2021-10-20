require_relative 'board'
require_relative 'player'
require_relative 'tic_tac_toe'
require_relative 'rules'

class Game
    attr_accessor :board, :player1, :player2, :rules

    def initialize
        @board = Board.new
        @player1 = Player.new(1, "X")
        @player2 = Player.new(2, "O")
        @rules = Rules.new(board)
    end

    def get_current_player
        board.turn_count.odd? ? player2 : player1
    end

    def turn
        move = get_current_player.get_move
        board.valid_move?(move, get_current_player.symbol)
    end

    def play
        until rules.game_over?
            turn
            board.display_board

            if rules.won?
                puts "Player #{rules.winner} has won this round!"
            elsif rules.draw?
                puts "It's a draw! Better luck next time."
            end
        end
    end
end

