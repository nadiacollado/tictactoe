require 'player'

describe Player do
    let (:player) { Player.new(HUMAN_PLAYER) }

    describe "initialize" do
        it "creates a player" do
            expect(player.player_type).to eq(HUMAN_PLAYER)
        end
    end
end