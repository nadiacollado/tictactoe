require 'markers'

describe Markers do
    let (:marker) { Markers.new("Y", "N") }

    describe "p1" do
        it "returns the first player's marker" do
            expect(marker.p1).to eq ("Y")
        end
    end

    describe "p2" do
        it "returns the second player's marker" do
            expect(marker.p2).to eq ("N")
        end
    end
end