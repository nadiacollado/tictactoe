class Board
    attr_reader :squares

    def initialize(squares = %w[1 2 3 4 5 6 7 8 9])
        @squares = squares
    end

    def valid_move?(move)
        if move > 0 && move <= 9 && !square_taken?(move)
            true
        else
            false
        end
    end

    def square_taken?(move)
        CLEAR_BOARD.include?(squares[move - 1]) ? false : true
    end

    def mark_square(move, player)
        squares[move - 1] = player
    end

    def unmark_square(move)
        squares[move - 1] = move.to_s
    end

    def board_clear?
        squares == CLEAR_BOARD
    end

    def board_full?
        squares.all? {|square| square_taken?(square.to_i)}
    end

    def get_available_squares
        available_squares = []
        squares.each {|square|
            square = square.to_i
            if !square_taken?(square)
                available_squares.push(square)
            end
        }
        available_squares
    end

    def turn_count
        count = 0
        squares.each {|square|  
            !CLEAR_BOARD.include?(square) ? count += 1 : nil
        }
        count
    end
end

