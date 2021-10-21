describe Rules do
    let (:board) { Board.new }
    let (:rules) { Rules.new }
    let (:symbols) { Symbols.new }

    describe "won?" do
        it "returns winner of game if game has been won" do
            board = Board.new(%w[X X X O O X O X O])
            expect(rules.won?(board)).to eq(symbols.player1_marker)
        end

        it "returns false if game has not been won" do
            board = Board.new(%w[X 2 X O 5 X 7 X O])
            expect(rules.won?(board)).to eq(false)
        end
    end

    describe "winner" do
        it "returns winner of game if game has been won" do
            board = Board.new(%w[X O X O O O O X X])
            expect(rules.winner(board)).to eq(symbols.player2_marker)
        end

        it "returns false if game has not been won" do
            board = Board.new(%w[X 2 X O 5 X 7 X O])
            expect(rules.winner(board)).to eq(false)
        end
    end

    describe "draw?" do
        it "returns true if the board is full and there is no winner" do
            board = Board.new(%w[X O X O O X O X O])
            expect(rules.draw?(board)).to eq(true)
        end
    end

    describe "game_over?" do
        it "returns true if the board is full and there is no winner" do
            board = Board.new(%w[X O X O O X O X O])
            expect(rules.game_over?(board)).to eq(true)
        end
    end
end