require_relative 'constants'

class Game
    attr_reader :board, :rules, :player1, :player2, :display, :manager

    def initialize(board, player1, player2, display, manager)
        @board = board
        @player1 = player1
        @player2 = player2
        @display = display
        @manager = manager
        @rules = Rules.new
    end

    def get_current_player
        board.turn_count.odd? ? player2 : player1
    end

    # BUG: prints invalid_move every time the Computer plays
    def turn
        move = manager.get_move(get_current_player, board)
        if !board.valid_move?(move, get_current_player.marker) && get_current_player.type == HUMAN_PLAYER
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

