require 'player'

describe Player do
    let (:marker) { Marker.new("X", "O") }
    let (:test_player) { Player.new(1, marker.p1_marker)}

    describe "initialize" do
        it "creates a new player with given arguments" do
            expect(test_player.id).to eq(1)
            expect(test_player.marker).to eq(marker.p1_marker)
        end
    end

    describe "get_move" do
        it "returns the current player's move via the gets method" do
            allow(test_player).to receive(:gets).and_return("1")
            expect(test_player.get_move).to eq(1)
        end
    end
end