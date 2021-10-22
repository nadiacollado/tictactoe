require_relative 'symbols'

class Board
    attr_reader :squares

    def initialize(squares = %w[1 2 3 4 5 6 7 8 9])
        @squares = squares
    end

    CLEAR_BOARD = %w[1 2 3 4 5 6 7 8 9]

    def display_board
        puts "\n #{squares[0]} | #{squares[1]} | #{squares[2]} "
        puts "-----------"
        puts " #{squares[3]} | #{squares[4]} | #{squares[5]} "
        puts "-----------"
        puts " #{squares[6]} | #{squares[7]} | #{squares[8]}
        \n"
    end

    def valid_move?(move, player)
        if move > 0 && move <= 9 && !square_taken?(move)
            mark_square(move, player)
        else
            puts "Sorry that move is not valid. Please try again."
        end
    end

    def square_taken?(move)
        CLEAR_BOARD.include?(squares[move - 1]) ? false : true
    end

    def mark_square(move, player)
        squares[move - 1] = player
    end

    def board_full?
        squares.all? {|square| square_taken?(square.to_i)}
    end

    def turn_count
        count = 0
        squares.each {|square|  
            !CLEAR_BOARD.include?(square) ? count += 1 : nil
        }
        count
    end
end

