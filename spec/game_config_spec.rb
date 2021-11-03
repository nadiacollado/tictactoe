require 'game_config'

describe GameConfig do
    let (:game_config) { GameConfig.new }

    describe "humans_only?" do
        it "returns true if player chooses human versus human game" do
            allow(game_config.display).to receive(:get_player_type).and_return(HUMAN_PLAYER)
            expect(game_config.humans_only?).to eq(true)
        end

        it "returns false if player chooses computer player" do
            allow(game_config.display).to receive(:get_player_type).and_return(COMPUTER_PLAYER)
            expect(game_config.humans_only?).to eq(false)
        end
    end

    describe "build_players" do
        it "creates human player instances when prompted" do
            allow(game_config.display).to receive(:get_player_type).and_return(HUMAN_PLAYER)
            expect(game_config.humans_only?).to eq(true)
            game_config.build_players
            expect(game_config.player1.type).to eq(HUMAN_PLAYER)
        end

        it "creates computer player instance when prompted" do
            allow(game_config.display).to receive(:get_player_type).and_return(COMPUTER_PLAYER)
            expect(game_config.humans_only?).to eq(false)
            game_config.build_players
            expect(game_config.player1.type).to eq(COMPUTER_PLAYER)
        end

        it "creates a human player instance for player 2 for human v computer games" do
            allow(game_config.display).to receive(:get_player_type).and_return(COMPUTER_PLAYER)
            expect(game_config.humans_only?).to eq(false)
            game_config.build_players
            expect(game_config.player2.type).to eq(HUMAN_PLAYER)
        end

        it "creates a human player instance for player 2 for human v human games" do
            allow(game_config.display).to receive(:get_player_type).and_return(HUMAN_PLAYER)
            expect(game_config.humans_only?).to eq(true)
            game_config.build_players
            expect(game_config.player2.type).to eq(HUMAN_PLAYER)
        end
    end
end