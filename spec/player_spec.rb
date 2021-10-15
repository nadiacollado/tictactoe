describe Player do
    let (:test_player) {Player.new(1, "X")}

    describe "initialize" do
        it "creates a new player with given arguments" do
            expect(test_player.player_num).to eq(1)
            expect(test_player.symbol).to eq("X")
        end
    end

    describe "get_move" do
        it "returns the current player's move via the gets method" do
            allow(test_player).to receive(:gets).and_return("1")
            expect(test_player.get_move).to eq("1")
        end
    end
end