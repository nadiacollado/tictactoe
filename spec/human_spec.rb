require 'human'

describe Human do
    let (:board) { Board.new }
    let (:marker) { Markers.new("X", "O") }
    let (:human_player) { Human.new(1, marker.p1) }

    describe "initialize" do
        it "creates a new human player with given arguments" do
            expect(human_player.id).to eq(1)
            expect(human_player.marker).to eq(marker.p1)
        end
    end

    describe "get_move" do
        it "returns the current player's move via the gets method" do
            allow(human_player).to receive(:gets).and_return("1")
            expect(human_player.get_move(board)).to eq(1)
        end
    end
end