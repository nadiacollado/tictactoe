require_relative 'board'
require_relative 'player'
require_relative 'tic_tac_toe'

class Game
    attr_accessor :board, :player1, :player2, :current_player

    def initialize
        @board = Board.new
        @player1 = Player.new(1, "X")
        @player2 = Player.new(2, "O")
        @current_player = player1
        @game_ended = false
    end

    WINNING_COMBOS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    # does this belong in this class?

    def current_player
        board.turn_count.odd? ? player2 : player1
    end

    # how to test that methods are being called
    # how to test that a specfic thing is being printed 

    def turn
        puts "Player #{current_player.symbol}, you're up!\n"
        current_move = get_move

        if board.valid_move?(current_move)
            board.mark_square(current_move, current_player.symbol)
            board.display_board
        else
            puts "Sorry that move is not valid. Please try again."
        end
    end

    def play
        until @game_ended
            turn
            winner = won?
            if winner
                puts "Player #{winner} has won this round!"
                @game_ended = true
            elsif draw?
                puts "It's a draw! Better luck next time."
                @game_ended = true
            end
        end
    end

    # how to test for an input 
    def get_move
        gets.chomp
    end

    # is there a better way to do this? syntax wise
    def won?
        WINNING_COMBOS.each do |combo|
            square_1 = board.squares[combo[0]]
            square_2 = board.squares[combo[1]]
            square_3 = board.squares[combo[2]]

            if square_1 == square_2 && square_2 == square_3
                @game_ended = true
                return square_1
            end
        end
        return false
    end

    def draw?
        !won? && board.board_full?
    end
end

