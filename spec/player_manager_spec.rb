require 'player_manager'

describe PlayerManager do
    let (:marker) { Marker.new("A", "B")}
    let (:player_manager) { PlayerManager.new(marker) }

    describe "set_players" do
        it "creates human player" do
            player_manager.set_players(marker.p1_marker, "H")
            expect(player_manager.player1.id).to eq(1)
            expect(player_manager.player1.marker).to eq("A")
        end
    end
end