class Computer
    attr_accessor :id, :marker, :strategy

    def initialize(id, marker, strategy)
        @id = id
        @marker = marker
        @strategy = strategy
    end

    def get_move(board)
        strategy.get_move(board, marker)
    end
end