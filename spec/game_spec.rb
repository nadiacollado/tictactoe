require "game"
require "board"

describe Game do
    let (:game) {Game.new}
    let (:board) {Board.new}

    describe "current_player" do
        it "returns current_player" do
            board = Board.new(%w[X 2 X X 5 6 7 8 9])
            expect(game.current_player(board).symbol).to eq("O")
        end
    end

    describe "won?" do
        it "returns winner of game if game has been won" do
            board = Board.new(%w[
                X X X 
                0 0 X
                0 X 0])
            expect(game.won?(board)).to eq("X")
        end

        it "returns false if game is a draw" do
            board = Board.new(%w[
                X 0 X 
                0 0 X
                0 X 0])
            expect(game.won?(board)).to eq(false)
        end
    end
end