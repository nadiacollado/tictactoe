class Computer
    attr_accessor :id, :marker, :strategy

    def initialize(id, marker, strategy)
        @id = id
        @marker = marker
        @strategy = strategy
    end

    # def get_move(board, player)
    #     player.type == AI_COMPUTER ? get_move_ai(board, player.marker) : get_move_easy(board)
    # end

    def get_move(board)
        strategy.get_move(board, marker)
    end

    # def get_move_easy(board)
    #     if board.board_clear?
    #         move = 1
    #     else
    #         move = move_generator
    #         until board.valid_move?(move, marker)
    #             move = move_generator
    #         end
    #         move
    #     end
    # end

    # def get_move_ai(board, player)
    #     best_score = -1000
    #     best_move = nil

    #     available_squares = get_available_squares(board.squares)
    #     available_squares.each{|square|
    #         square = make_integer(square)
    #         board_copy = copy_board(board.squares)
    #         mark_board_copy(board_copy, square, player)
    #         score = minimax(board_copy, 0, false)
    #         if score > best_score
    #             best_score = score 
    #             best_move = square
    #         end
    #     }
    #     best_move
    # end

    # def get_score(board, depth)
    #     winner = won?(board)
    #     return 0 unless winner
    #     winner == marker ? 10 - depth : -10 + depth
    # end

    # def minimax(board, depth, maximizing)
    #     final_score = get_score(board, depth)
    #     return final_score if final_score != 0 || draw?(board)

    #     available_squares = get_available_squares(board)
    #     best_score = maximizing ? -1000 : Float::INFINITY

    #     available_squares.each{|square|
    #         square = make_integer(square)
    #         board_copy = copy_board(board)
    #         mark_board_copy(board_copy, square, player_mark(maximizing))
    #         score = minimax(board_copy, depth + 1, !maximizing)
    #         best_score = score_comparison(score, best_score, maximizing)
    #     }
    #     return best_score
    # end

    # def score_comparison(score, best_score, maximizing)
    #     maximizing ? [score, best_score].max : [score, best_score].min
    # end

    # def player_mark(maximazing)
    #     maximazing ? AI : HUMAN
    # end

    # def board_full(board)
    #     board.all? {|square| !CLEAR_BOARD.include?(square)}
    # end

    # def draw?(board)
    #     !won?(board) && board_full(board)
    # end

    # def won?(board)
    #     WINNING_COMBOS.each do |combo|
    #         square_1 = board[combo[0]]
    #         square_2 = board[combo[1]]
    #         square_3 = board[combo[2]]

    #         if square_1 == square_2 && square_2 == square_3
    #             return square_1
    #         end
    #     end
    #     return false
    # end

    # def copy_board(board)
    #     board_copy = board.slice(0..-1)
    # end

    # def get_available_squares(board)
    #     available_squares = []
    #     board.each {|square|
    #         if CLEAR_BOARD.include?(square)
    #             available_squares.push(square)
    #         end
    #     }
    #     available_squares
    # end

    # def make_integer(square)
    #     square.to_i
    # end

    # def mark_board_copy(board, square, marker)
    #     board[square - 1] = marker
    # end
end