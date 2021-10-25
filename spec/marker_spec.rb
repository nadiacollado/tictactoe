require 'marker'

describe Marker do
    let (:marker) { Marker.new("Y", "N") }

    describe "player1_marker" do
        it "returns the first player's marker" do
            expect(marker.p1_marker).to eq ("Y")
        end
    end

    describe "player2_marker" do
        it "returns the second player's marker" do
            expect(marker.p2_marker).to eq ("N")
        end
    end
end