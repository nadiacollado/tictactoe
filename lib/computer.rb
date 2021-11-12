class Computer
    attr_accessor :id, :marker, :type

    def initialize(id, marker, type)
        @id = id
        @marker = marker
        @type = type
    end

    def move_generator
        rand(1..9)
    end

    def get_move(board, player)
        player.type == AI_COMPUTER ? get_move_ai(board, player.marker) : get_move_easy(board)
    end

    def get_move_easy(board)
        if board.board_clear?
            move = 1
        else
            move = move_generator
            until board.valid_move?(move, marker)
                move = move_generator
            end
            move
        end
    end

    def get_move_ai(board, player)
        best_score = -100000
        best_move = nil

        available_squares = get_available_squares(board.squares)
        available_squares.each{|square|
            square = make_integer(square)
            board_copy = copy_board(board.squares)
            mark_board(board_copy, square, player)
            score = minimax(board_copy, false)
            if score > best_score
                best_score = score 
                best_move = square
            end
        }
        best_move
    end

    def get_score(board)
        winner = won?(board)
        return 0 unless winner
        winner == marker ? 10 : -10
    end

    def minimax(board, maximixer)
        final_score = get_score(board)
        if final_score != 0 || draw?(board)
            return final_score
        end

        available_squares = get_available_squares(board)

        if maximixer
            best_score = -100000
            available_squares.each{|square|
                square = make_integer(square)
                board_copy = copy_board(board)
                mark_board(board_copy, square, AI)
                score = minimax(board_copy, false)
                best_score = [score, best_score].max
            }
            return best_score
        else
            best_score = Float::INFINITY
            available_squares.each{|square|
                square = make_integer(square)
                board_copy = copy_board(board)
                mark_board(board_copy, square, HUMAN)
                score = minimax(board_copy, true)
                best_score = [score, best_score].min
            }
            return best_score
        end
    end

    def board_full(board)
        board.all? {|square| !CLEAR_BOARD.include?(square)}
    end

    def draw?(board)
        !won?(board) && board_full(board)
    end

    def won?(board)
        WINNING_COMBOS.each do |combo|
            square_1 = board[combo[0]]
            square_2 = board[combo[1]]
            square_3 = board[combo[2]]

            if square_1 == square_2 && square_2 == square_3
                return square_1
            end
        end
        return false
    end

    def copy_board(board)
        board_copy = board.slice(0..-1)
    end

    def get_available_squares(board)
        available_squares = []
        board.each {|square|
            if CLEAR_BOARD.include?(square)
                available_squares.push(square)
            end
        }
        available_squares
    end

    def make_integer(square)
        square.to_i
    end

    def mark_board(board, square, marker)
        board[square - 1] = marker
    end
end