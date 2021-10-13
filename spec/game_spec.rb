require "game"
require "board"

describe Game do
    let (:game) {Game.new}
    let (:board) {Board.new}

    describe "current_player" do
        it "returns current_player" do
            squares = [
                "1", "X", "3", 
                "O", "O", "X", 
                "7", "8", "9" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.current_player.symbol).to eq("X")
        end
    end

    describe "won?" do
        it "returns winner of game if game has been won" do
            squares = [
                "X", "X", "X", 
                "O", "O", "X", 
                "O", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq("X")
        end

        it "returns false if game is a draw" do
            squares = [
                "X", "O", "X", 
                "O", "O", "X", 
                "O", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq(false)
        end
    end
end