require_relative 'symbols'

class Board
    attr_reader :squares

    def initialize(squares = %w[1 2 3 4 5 6 7 8 9])
        @squares = squares
    end

    def display_board
        puts "\n #{squares[0]} | #{squares[1]} | #{squares[2]} "
        puts "-----------"
        puts " #{squares[3]} | #{squares[4]} | #{squares[5]} "
        puts "-----------"
        puts " #{squares[6]} | #{squares[7]} | #{squares[8]}
        \n"
    end

    def valid_move?(move, player, symbols)
        if move > 0 && move <= 9 && !square_taken?(move, symbols)
            mark_square(move, player)
        else
            puts "Sorry that move is not valid. Please try again."
        end
    end

    def square_taken?(move, symbols)
        squares[move - 1] == symbols.player1_marker || squares[move - 1] == symbols.player2_marker
    end

    def mark_square(move, player)
        squares[move - 1] = player
    end

    def board_full?
        squares.none? {|square| '123456789'.include?(square)}
    end

    def turn_count(symbols)
        squares.count(symbols.player1_marker) + squares.count(symbols.player2_marker)
    end
end

