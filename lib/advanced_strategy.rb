require_relative 'board'

class AdvancedStrategy
    attr_reader :rules

    def initialize
        @rules = Rules.new
    end

    def get_move(board, marker)
        best_score = -1000
        best_move = nil

        board.squares.each{|square|
            square = make_integer(square)
            if board.valid_move?(square)
                board.mark_square(square, marker)
                score = minimax(board, 0, false)
                    if score > best_score
                        best_score = score 
                        best_move = square
                    end
                    board.unmark_square(square)
            end
        }
        best_move
    end

    def get_score(board, depth)
        winner = rules.won?(board)
        return 0 unless winner
        winner == AI ? 10 - depth : -10 + depth
    end

    def minimax(board, depth, maximizing)
        final_score = get_score(board, depth)
        return final_score if final_score != 0 || rules.draw?(board)

        player = player_mark(maximizing)
        best_score = maximizing ? -1000 : Float::INFINITY

        board.squares.each{|square|
            square = make_integer(square)
            if board.valid_move?(square)
                board.mark_square(square, player)
                score = minimax(board, depth + 1, !maximizing)
                best_score = score_comparison(score, best_score, maximizing)
                board.unmark_square(square)
            end
        }
        return best_score
    end

    def score_comparison(score, best_score, maximizing)
        maximizing ? [score, best_score].max : [score, best_score].min
    end

    def player_mark(maximazing)
        maximazing ? AI : HUMAN
    end

    def make_integer(square)
        square.to_i
    end
end

# USES NEW INSTANCE OF BOARD. DOES NOT WORK.

#     def get_move(board, marker)
#         best_score = -1000
#         best_move = nil
    
#         available_squares = board.get_available_squares

#         available_squares.each{|square|
#             possible_board = Board.new(board.squares)
#             possible_board.mark_square(square, AI)
#             score = minimax(possible_board, 0, false)
#             if score > best_score
#                 best_score = score 
#                 best_move = square
#             end
#         }
#         best_move
#     end

#     def get_score(board, depth)
#         winner = rules.won?(board)
#         return 0 unless winner
#         winner == AI ? 10 - depth : -10 + depth
#     end
    
#     def minimax(board, depth, maximizing)
#         final_score = get_score(board, depth)
#         return final_score if final_score != 0 || rules.draw?(board)
    
#         available_squares = board.get_available_squares
#         best_score = maximizing ? -1000 : Float::INFINITY
    
#         available_squares.each{|square|
#             possible_board = Board.new(board.squares)
#             possible_board.mark_square(square, player_mark(maximizing))
#             score = minimax(possible_board, depth + 1, !maximizing)
#             best_score = score_comparison(score, best_score, maximizing)
#         }
#         return best_score
#     end
    
#     def score_comparison(score, best_score, maximizing)
#         maximizing ? [score, best_score].max : [score, best_score].min
#     end
    
#     def player_mark(maximazing)
#         maximazing ? AI : HUMAN
#     end
# end


# MINIMAX WORKS w COPY OF BOARD ARRAY

#     def get_move(board, player)
#         best_score = -1000
#         best_move = nil

#         available_squares = get_available_squares(board.squares)
#         available_squares.each{|square|
#             square = make_integer(square)
#             board_copy = copy_board(board.squares)
#             puts "board copy #{board_copy}"
#             mark_board_copy(board_copy, square, player)
#             puts "board copy #{board_copy}"
#             score = minimax(board_copy, 0, false)
#             if score > best_score
#                 best_score = score 
#                 best_move = square
#             end
#         }
#         best_move
#     end

#     def get_score(board, depth)
#         winner = won?(board)
#         return 0 unless winner
#         winner == AI ? 10 - depth : -10 + depth
#     end

#     def minimax(board, depth, maximizing)
#         final_score = get_score(board, depth)
#         return final_score if final_score != 0 || draw?(board)

#         available_squares = get_available_squares(board)
#         best_score = maximizing ? -1000 : Float::INFINITY

#         available_squares.each{|square|
#             square = make_integer(square)
#             board_copy = copy_board(board)
#             mark_board_copy(board_copy, square, player_mark(maximizing))
#             score = minimax(board_copy, depth + 1, !maximizing)
#             best_score = score_comparison(score, best_score, maximizing)
#         }
#         return best_score
#     end

#     def score_comparison(score, best_score, maximizing)
#         maximizing ? [score, best_score].max : [score, best_score].min
#     end

#     def player_mark(maximazing)
#         maximazing ? AI : HUMAN
#     end

#     def board_full(board)
#         board.all? {|square| !CLEAR_BOARD.include?(square)}
#     end

#     def draw?(board)
#         !won?(board) && board_full(board)
#     end

#     def won?(board)
#         WINNING_COMBOS.each do |combo|
#             square_1 = board[combo[0]]
#             square_2 = board[combo[1]]
#             square_3 = board[combo[2]]

#             if square_1 == square_2 && square_2 == square_3
#                 return square_1
#             end
#         end
#         return false
#     end

#     def copy_board(board)
#         board_copy = board.slice(0..-1)
#     end

#     def get_available_squares(board)
#         available_squares = []
#         board.each {|square|
#             if CLEAR_BOARD.include?(square)
#                 available_squares.push(square)
#             end
#         }
#         available_squares
#     end

#     def make_integer(square)
#         square.to_i
#     end

#     def mark_board_copy(board, square, marker)
#         board[square - 1] = marker
#     end
# end