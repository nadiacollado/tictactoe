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
        until won?
            current_move = get_move(current_player.symbol)

            if board.valid_move?(current_move)
                board.mark_square(current_move, current_player.symbol)
                board.display_board

                if board.board_full?
                    winner = won?
                    puts winner
                    if winner
                        "Player #{winner}, you have won this round!"
                    else
                        # tie
                    end 
                else
                    # update board with the move
                    # change player turn
                end
            else
                puts "Sorry that move is not valid. Please try again."
            end
        end
    end

    def winning_combos
        [[0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]]
    end

    def get_move(player_symbol)
        puts "Player #{player_symbol}, you're up!\n"
        player_move = gets.chomp
    end

    def won?
        winning_combos.each do |combo|
            win_idx_1 = combo[0]
            win_idx_2 = combo[1]
            win_idx_3 = combo[2]

            square_1 = board.squares[win_idx_1]
            square_2 = board.squares[win_idx_2]
            square_3 = board.squares[win_idx_3]

            if square_1 == square_2 && square_2 == square_3
                puts "Player #{square_1} has won this round!"
                return square_1
            end
        end
        return false
    end
end

