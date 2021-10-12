require_relative 'board'

class TicTacToe
    attr_accessor :board

    def initialize
        @board = Board.new
    end

    def print_welcome
        puts "\nWelcome to Tic-Tac-Toe!\n"
    end

    def print_game_instructions
        instructions = "\nEach square in the board corresponds to a number 1-9.\nMake your move by entering the number in the square of your choice.\n"
        puts instructions
    end

    def print_board
        board.display_board
    end
end

