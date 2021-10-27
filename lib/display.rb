class Display

    WELCOME = "\nWelcome to Tic-Tac-Toe!\n"
    INSTRUCTIONS = "\nEach square in the board corresponds to a number 1-9.\nMake your move by entering the number in the square of your choice.\n"
    PLAYERS_CHOICE = "\nWhat kind of game would you like to play? Enter 'H' for a single player game or 'C' to play against a computer."

    def initialize(board)
        @print_welcome = print(WELCOME)
        @print_board = print_board(board)
        @print_instructions = print(INSTRUCTIONS)
        @print_players_choice = print(PLAYERS_CHOICE)
    end

    def print(message)
        puts message
    end

    def get_player_type
        gets.chomp
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

