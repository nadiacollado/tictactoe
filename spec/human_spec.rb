require 'human'
require 'players'

describe Human do
    let (:board) { Board.new }
    let (:marker) { Marker.new("X", "O") }
    let (:test_player) { Human.new(1, marker.p1_marker, HUMAN_PLAYER)}

    describe "initialize" do
        it "creates a new human player with given arguments" do
            expect(test_player.id).to eq(1)
            expect(test_player.marker).to eq(marker.p1_marker)
        end
    end

    describe "get_move" do
        it "returns the current player's move via the gets method" do
            allow(test_player).to receive(:gets).and_return("1")
            expect(test_player.get_move(board)).to eq(1)
        end
    end
end