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
        current_player = get_current_player
        display.print_turn_prompt(current_player.marker)
        move = current_player.get_move(board, current_player, rules)
        if board.valid_move?(move, current_player.marker)
            board.mark_square(move, current_player.marker)
            display.print_board(board)
        else
            display.print(INVALID_MOVE)
        end
    end

    def play
        until rules.game_over?(board)
            turn
            if rules.won?(board)
                display.print_winner(rules.winner(board))
            elsif rules.draw?(board)
                display.print(TIE)
            end
        end
    end
end

