describe Player do
    before do
        @player = Player.new(55, "Banana")
    end

    describe "initialize" do
        it "creates a new player with given arguments" do
            expect(@player.player_num).to eq(55)
            expect(@player.symbol).to eq("Banana")
        end
    end
end