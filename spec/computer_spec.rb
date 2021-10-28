require 'computer'

describe Computer do
    let (:marker) { Marker.new("X", "O") }
    let (:computer_player) { Computer.new(1, marker.p1_marker, "computer")}

    describe "initialize" do
        it "creates a computer player with given arguments" do
            expect(computer_player.id).to eq(1)
            expect(computer_player.marker).to eq(marker.p1_marker)
        end
    end

    describe "move_generator" do
        it "randomly selects a number 1-9" do
            expect(computer_player.move_generator).to be_between(1, 9)
        end
    end
end