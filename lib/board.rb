class Board
    attr_reader :cells

    def initialize
        @cells = %w[1 2 3 4 5 6 7 8 9]
    end

    def display_board
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(user_input)
        cells[user_input.to_i-1]
    end

    def board_full?
        cells.alls? {|cell| cell = "X" || cell = "O"}
    end

    def cell_taken?(position)
    end

end