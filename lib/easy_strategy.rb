class EasyStrategy
    def move_generator
        rand(1..9)
    end

    def get_move(board, marker)
        if board.board_clear?
            move = 1
        else
            move = move_generator
            until board.valid_move?(move)
                move = move_generator
            end
            move
        end
    end
end