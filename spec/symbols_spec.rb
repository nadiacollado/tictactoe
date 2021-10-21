require 'symbols'

describe Symbols do
    let (:symbols) { Symbols.new }

    describe "player1_marker" do
        it "returns the first player's symbol" do
            expect(symbols.player1_marker).to eq ("X")
        end
    end

end