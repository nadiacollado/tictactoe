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

    def current_player
        board.turn_count.odd? ? player2 : player1
    end

    def turn
        current_move = get_move(current_player.symbol)
        
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
            if won?
                winner = won?
                puts "Player #{winner}, you have won this round!"
            else
                if board.board_full?
                    puts "It's a draw! Better luck next time."
                    @game_ended = true
                end
            end
        end
    end

    def get_move(player_symbol)
        puts "Player #{player_symbol}, you're up!\n"
        player_move = gets.chomp
    end

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
end

