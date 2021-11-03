# require_relative 'player'

class Computer < Player
    attr_accessor :id, :marker, :type

    def initialize(id, marker, type)
        @id = id
        @marker = marker
        @type = type
    end

    def move_generator
        rand(1..9)
    end

    def get_move(board)
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
end