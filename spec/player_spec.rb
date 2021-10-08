describe Player do
    let (:test_player) {Player.new(1, "X")}

    describe "initialize" do
        it "creates a new player with given arguments" do
            expect(test_player.player_num).to eq(1)
            expect(test_player.symbol).to eq("X")
        end
    end
end