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
                score = minimax(board, 0, false, marker)
                    if score > best_score
                        best_score = score 
                        best_move = square
                    end
                board.unmark_square(square)
            end
        }
        best_move
    end

    def get_score(board, depth, marker)
        winner = rules.won?(board)
        return 0 unless winner
        winner == marker ? 10 - depth : -10 + depth
    end

    def minimax(board, depth, maximizing, marker)
        final_score = get_score(board, depth, marker)
        return final_score if final_score != 0 || rules.draw?(board)

        player = player_mark(maximizing, marker)
        best_score = maximizing ? -1000 : Float::INFINITY

        board.squares.each{|square|
            square = make_integer(square)
            if board.valid_move?(square)
                board.mark_square(square, player)
                score = minimax(board, depth + 1, !maximizing, marker)
                best_score = score_comparison(score, best_score, maximizing)
                board.unmark_square(square)
            end
        }
        return best_score
    end

    def score_comparison(score, best_score, maximizing)
        maximizing ? [score, best_score].max : [score, best_score].min
    end

    def player_mark(maximazing, marker)
        maximazing ? marker : opponent_mark(marker)
    end

    def opponent_mark(marker)
        marker == PLAYER_ONE ? PLAYER_TWO : PLAYER_ONE
    end

    def make_integer(square)
        square.to_i
    end
end