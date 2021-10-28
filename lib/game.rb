require_relative 'board'
require_relative 'player'
require_relative 'rules'
require_relative 'game_config'
require_relative 'constants'

class Game
    attr_reader :board, :rules, :player1, :player2, :display

    def initialize(board, player1, player2, display)
        @board = board
        @player1 = player1
        @player2 = player2
        @display = display
        @rules = Rules.new
    end

    def get_current_player
        board.turn_count.odd? ? player2 : player1
    end

    def turn
        move = get_current_player.get_move
        if !board.valid_move?(move, get_current_player.marker)
            display.print(INVALID_MOVE)
        end
    end

    def play
        until rules.game_over?(board)
            turn
            display.print_board(board)

            if rules.won?(board)
                display.print_winner(rules.winner(board))
            elsif rules.draw?(board)
                display.print(TIE)
            end 
        end
    end
end

