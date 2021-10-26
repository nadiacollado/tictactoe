class GameConfig

    attr_reader :board

    def initialize
        @board = Board.new
        @marker = Marker.new
        @display = Display.new(board)
        @player1 = Player.new(1, marker.p1_marker)
        @player2 = Player.new(2, marker.p2_marker)
    end
end
