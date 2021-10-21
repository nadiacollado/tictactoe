require_relative 'board'
require_relative 'player'
require_relative 'rules'

class Game
    attr_reader :board, :player1, :player2, :rules

    def initialize(board, player1, player2, rules)
        @board = board
        @player1 = player1
        @player2 = player2
        @rules = rules
    end

    def get_current_player
        board.turn_count.odd? ? player2 : player1
    end

    def turn
        move = get_current_player.get_move
        board.valid_move?(move, get_current_player.symbol)
    end

    def play
        until rules.game_over?(board)
            turn
            board.display_board

            if rules.won?(board)
                puts "Player #{rules.winner(board)} has won this round!"
            elsif rules.draw?(board)
                puts "It's a draw! Better luck next time."
            end
        end
    end
end

