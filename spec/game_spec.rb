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
end