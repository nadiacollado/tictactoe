class Board
    attr_reader :cells

    def initialize
        @cells = %w[1 2 3 4 5 6 7 8 9]
    end

    def display_board
        puts "\n #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]}
        \n"
        
        "
         1 | 2 | 3              
        -----------                 
         4 | 5 | 6              
        -----------                
         7 | 8 | 9"
    end

    # checks if user move is valid
    def valid_move(move)
        # checks to see if it falls within the alloted number range
        if move > 0 && move <= 9
            cell_taken(move)
        else
            false
        end
    end

    # checks if all 
    def board_full?
        cells.alls? {|cell| cell = "X" || cell = "O"}
    end


    # checks who's turn it is by counting the number of moves made on the board
    def turn_count
        cells.count("X") + cells.count("O")
    end


    # checks is cell is already occupied 
    def cell_taken?(move)
        cells[move] != "X" && cells[move] != "O"
    end

end