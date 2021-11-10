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

    def get_move(board, current_player)
        current_player.type == AI_COMPUTER ? get_move_ai(board, current_player) : get_move_easy(board)
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

    def won?(board)
        WINNING_COMBOS.each do |combo|
            square_1 = board.squares[combo[0]]
            square_2 = board.squares[combo[1]]
            square_3 = board.squares[combo[2]]

            if square_1 == square_2 && square_2 == square_3
                return square_1
            end
        end
        return false
    end

    def get_move_ai(board, current_player)
        best_score = -1000
        best_move = 0

        if board.board_clear?
            best_move = 5
        # loop through board to check for available spots
        # update board by marking AI on each available spot
        # run minimax algorithm on the board after each update
        #             # i.e minimax(board)
        else
            available_squares = board.get_available_squares
            available_squares.each{|square|
                board_copy = board.copy_board
                board_copy[square] = current_player.marker
                # minimax will return a score for that particular update
                # if score is greater than current score, replace it and mark the board with the corresponding move
                score = minimax(board_copy, current_player)
                if score > best_score
                    best_score = score
                    best_move = square
                end
            }
        end
        best_move
    end

    def get_score(board)
        # if there's no winner return 0
        winner = won?(board)
        return 0 unless winner
        winner == marker ? 10 : -10
    end

    def minimax(board, player)
        score = get_score(board)
    end

    # def best_move(board)
    # end
end