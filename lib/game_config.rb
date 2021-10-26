class GameConfig

    attr_reader :board

    def initialize
        @board = Board.new
        @display = TicTacToe.new(board)
        # @player_config = PlayerConfig.new
    end
end
