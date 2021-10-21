require 'symbols'

describe Symbols do
    let (:symbols) { Symbols.new }

    describe "player1_marker" do
        it "returns the first player's marker" do
            expect(symbols.player1_marker).to eq ("X")
        end
    end

    describe "player2_marker" do
        it "returns the second player's marker" do
            expect(symbols.player2_marker).to eq ("O")
        end
    end
end