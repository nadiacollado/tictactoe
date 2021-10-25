class Display

    WELCOME = "\nWelcome to Tic-Tac-Toe!\n"
    INSTRUCTIONS = "\nEach square in the board corresponds to a number 1-9.\nMake your move by entering the number in the square of your choice.\n"

    def initialize(board)
        @print_welcome = print(WELCOME)
        @print_instructions = print(INSTRUCTIONS)
        @print_board = print_board(board)
    end

    def print(message)
        puts message
    end

    def print_board(board)
        puts "\n #{board.squares[0]} | #{board.squares[1]} | #{board.squares[2]} "
        puts "-----------"
        puts " #{board.squares[3]} | #{board.squares[4]} | #{board.squares[5]} "
        puts "-----------"
        puts " #{board.squares[6]} | #{board.squares[7]} | #{board.squares[8]}
        \n"
    end
end

