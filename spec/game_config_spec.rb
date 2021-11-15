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

    describe "computer_selection" do
        it "creates and returns an instance of the Computer class type easy" do
            allow(game_config.display).to receive(:get_computer_type).and_return(EASY_COMPUTER)
            expect(game_config.computer_selection).to be_an_instance_of(Computer)
            expect(game_config.computer_selection.strategy).to be_an_instance_of(EasyStrategy)
        end

        it "creates and returns an instance of the Computer class type AI" do
            allow(game_config.display).to receive(:get_computer_type).and_return(AI_COMPUTER)
            expect(game_config.computer_selection).to be_an_instance_of(Computer)
            expect(game_config.computer_selection.strategy).to be_an_instance_of(AdvancedStrategy)
        end
    end

    describe "build_players" do
        it "creates human player instances when prompted" do
            allow(game_config.display).to receive(:get_player_type).and_return(HUMAN_PLAYER)
            expect(game_config.humans_only?).to eq(true)
            game_config.build_players
            expect(game_config.player1).to be_an_instance_of(Human)
        end

        it "sets player1 to the correct computer player instance when prompted" do
            allow(game_config.display).to receive(:get_player_type).and_return(COMPUTER_PLAYER)
            allow(game_config.display).to receive(:get_computer_type).and_return(AI_COMPUTER)
            expect(game_config.humans_only?).to eq(false)
            game_config.build_players
            expect(game_config.player1).to be_an_instance_of(Computer)
        end

        it "creates a human player instance for player 2 for human v computer games" do
            allow(game_config.display).to receive(:get_player_type).and_return(COMPUTER_PLAYER)
            allow(game_config.display).to receive(:get_computer_type).and_return(EASY_COMPUTER)
            expect(game_config.humans_only?).to eq(false)
            game_config.build_players
            expect(game_config.player2).to be_an_instance_of(Human)
        end

        it "creates a human player instance for player 2 for human v human games" do
            allow(game_config.display).to receive(:get_player_type).and_return(HUMAN_PLAYER)
            allow(game_config.display).to receive(:get_computer_type).and_return(AI_COMPUTER)
            expect(game_config.humans_only?).to eq(true)
            game_config.build_players
            expect(game_config.player2).to be_an_instance_of(Human)
        end
    end
end