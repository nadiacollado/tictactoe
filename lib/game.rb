require_relative 'board'
require_relative 'player'
require_relative 'tic_tac_toe'

class Game
    attr_accessor :board, :player1, :player2

    def initialize
        @board = Board.new
        @player1 = Player.new(1, "X")
        @player2 = Player.new(2, "O")
    end

    WINNING_COMBOS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def player
        board.turn_count.odd? ? player2 : player1
    end

    def turn
        move = player.get_move
        board.valid_move?(move, player.symbol)
    end

    def play
        until game_over?
            turn
            board.display_board

            if won?
                puts "Player #{winner} has won this round!"
            elsif draw?
                puts "It's a draw! Better luck next time."
            end
        end
    end

    def won?
        WINNING_COMBOS.each do |combo|
            square_1 = board.squares[combo[0]]
            square_2 = board.squares[combo[1]]
            square_3 = board.squares[combo[2]]

            if square_1 == square_2 && square_2 == square_3
                return square_1
            end
        end
        return false
    end

    def winner
        won?
    end

    def draw?
        !won? && board.board_full?
    end

    def game_over?
        won? || draw?
    end
end

