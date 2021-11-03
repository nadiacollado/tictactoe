require 'player'

describe Player do
    let (:marker) { Marker.new("A", "B")}
    let (:player) { Player.new(1, marker.p1_marker, HUMAN_PLAYER) }

    describe "initialize" do
        it "creates a player with the correct marker and id" do
            expect(player.marker).to eq("A")
            expect(player.id).to eq(1)
            expect(player.type).to eq(HUMAN_PLAYER)
        end
    end
end