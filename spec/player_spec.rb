require 'player'

describe Player do
    let (:marker) { Marker.new("A", "B")}
    let (:player) { Player.new(marker) }

    describe "set_players" do
        it "creates human player" do
            player.set_players(marker.p1_marker, "H")
            expect(player.player1.id).to eq(1)
            expect(player.player1.marker).to eq("A")
        end
    end
end