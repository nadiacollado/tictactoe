require_relative 'board'

class Rules
    attr_reader :board

    def initialize(board)
        @board = board
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