class Board
    attr_reader :squares

    def initialize
        @squares = %w[1 2 3 4 5 6 7 8 9]
    end

    def display_board
        puts "\n #{squares[0]} | #{squares[1]} | #{squares[2]} "
        puts "-----------"
        puts " #{squares[3]} | #{squares[4]} | #{squares[5]} "
        puts "-----------"
        puts " #{squares[6]} | #{squares[7]} | #{squares[8]}
        \n"
    end

    # checks if user move is valid
    def valid_move?(move)
        move = move.to_i
        # checks to see if it falls within the alloted number range
        if move > 0 && move <= 9
            square_taken?(move)
        else
            false
        end
    end

    # checks is cell is already occupied 
    def square_taken?(move)
        squares[move - 1] != "X" && squares[move - 1] != "O"
    end

    def make_move(move, player)
        move = move.to_i
        squares[move - 1] = player
    end

    # checks if board is full
    def board_full?
        squares.all? {|square| square == "X" || square == "O"}
    end

    # checks who's turn it is by counting the number of moves made on the board
    def turn_count
        squares.count("X") + squares.count("O")
    end

end