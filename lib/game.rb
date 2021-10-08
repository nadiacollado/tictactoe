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
        @current_player = player1
    end

    def current_player
        board.turn_count.odd? ? player2 : player1
    end
    def play
        board.display_board

        # get current move
        current_move = get_move(current_player.symbol)

        # check if move is valid
        if board.valid_move?(current_move)
            # update board with move (add make_move method to Board class)
            board.mark_square(current_move, current_player.symbol)
            board.display_board
            if board.board_full?
                # check if game has been won or tied
                # if won/tied, then ends the game
            else
                # update board with the move
                # change player turn
            end
        else
            puts "Sorry that move is not valid. Please try again."
        end
    end

    def get_move(player_symbol)
        puts "Player #{player_symbol}, you're up!\n"
        player_move = gets.chomp
    end

    def won?
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

