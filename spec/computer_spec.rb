require 'computer'

describe Computer do
    let (:marker) { Marker.new("X", "O") }
    let (:computer_player) { Computer.new(1, marker.p1_marker, "computer")}

    describe "initialize" do
        fit "creates a computer player with given arguments" do
            expect(computer_player.id).to eq(1)
            expect(computer_player.marker).to eq(marker.p1_marker)
        end
    end
end