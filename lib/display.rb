require_relative 'constants'

class Display
    def initialize(board)
        @print_welcome = print(WELCOME)
        @print_board = print_board(board)
        @print_instructions = print(INSTRUCTIONS)
        @print_players_choice = print(PLAYERS_CHOICE)
    end

    def print(message)
        puts message
    end

    def print_winner(marker)
        puts "Player #{marker} has won this round!"
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

