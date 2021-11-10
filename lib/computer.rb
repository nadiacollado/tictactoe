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
    
    def get_move_ai(board, current_player)
        best_score = -1000
        best_move = 0

        if board.board_clear?
            best_move = 5
        end
        # else
        # # loop through board to check for available spots
        # # update board by marking AI on each available spot
        # # run minimax algorithm on the board after each update
        #             # i.e minimax(board)





        #     board.squares.each {|square|
        #         square = square.to_i
        #         if !board.square_taken?(square)
        #             board.mark_square(square, current_player.marker)
        #                # minimax will return a score for that particular update
        #                # if score is greater than current score, replace it and mark the board with the corresponding move
        #             score = minimax(board)
        #             if score > best_score
        #                 best_score = score
        #                 best_move = square
        #             end
        #         end
        #     }
        # end
        best_move
    end

    def minimax(board)
        1
    end

    # def best_move(board)
    # end
end