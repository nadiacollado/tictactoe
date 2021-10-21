require_relative 'board'
require_relative 'player'
require_relative 'rules'
require_relative 'symbols'

class Game
    attr_reader :board, :player1, :player2, :rules, :symbols

    def initialize(board, player1, player2, rules, symbols)
        @board = board
        @player1 = player1
        @player2 = player2
        @rules = rules
        @symbols = symbols
    end

    def get_current_player
        board.turn_count(symbols).odd? ? player2 : player1
    end

    def turn
        move = get_current_player.get_move
        board.valid_move?(move, get_current_player.symbol, symbols)
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

