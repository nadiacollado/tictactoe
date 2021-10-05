require_relative 'board'
require_relative 'player'
require_relative 'tic_tac_toe'

class Game
    def initialize
        @player1 = Player.new(1, "X")
        @player2 = Player.new(2, "O")

        @current_player = @player1
    end

    def play
        board = Board.new
        board.display_board
    end

    def ask_input(board, symbol)
        puts "#{symbol}'s turn"
    end
end

