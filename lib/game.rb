require_relative 'board'
require_relative 'player'
require_relative 'tic_tac_toe'

class Game
    attr_accessor :board, :player1, :player2, :current_player, :player_move

    def initialize
        @board = Board.new
        @player1 = Player.new(1, "X")
        @player2 = Player.new(2, "O")
        @player_move = player_move

    end

    def current_player
        board.turn_count.odd? ? player2 : player1
    end

    def play
        board.display_board

        # get current move
        current_move = get_move

        # check if move is valid
        if board.valid_move?(current_move)
            # change the board
            # check if game has been won or tied 
            # if won/tied, then ends the game
            # else updated the board with the move
            # changes player turn 
        else
            puts "Sorry that move is not valid. Please try again"
        end
    end

    def get_move
        # ask current player for move
        puts "#{current_player}, you're up!\n"

        # saves player's move
        @player_move = gets.chomp
    end

    def horizontal_win
        [[1, 2, 3], [4, 5, 6],[7, 8, 9]]
    end

    def vertical_win
        [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    end

    def diagonal_win
        [[1, 5, 9], [3, 5, 7]]
    end
end

