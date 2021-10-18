require "game"
require "board"

describe Game do
    let (:game) {Game.new}
    let (:board) {Board.new}

    describe "player" do
        it "returns current player" do
            squares = [
                "1", "X", "3", 
                "O", "O", "X", 
                "7", "8", "9" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.player.symbol).to eq("X")
        end
    end

    describe "turn" do
        it "marks the square on the board with a player's valid move" do
            allow(game.player).to receive(:get_move).and_return(3)
            game.turn
            expect(game.board.squares).to eq([
                "1", "2", "X", 
                "4", "5", "6", 
                "7", "8", "9" ])
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

        it "returns false if game has not been won" do
            squares = [
                "X", "2", "X", 
                "O", "5", "X", 
                "7", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq(false)
        end
    end

    describe "draw?" do
        it "returns true if the board is full and there is no winner" do
            squares = [
                "X", "O", "X", 
                "O", "O", "X", 
                "O", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.draw?).to eq(true)
        end
    end
end