require 'game_config'

describe GameConfig do
    let (:game_config) { GameConfig.new }

    describe "strategy_selection" do
        it "creates and returns an instance of EasyStrategy when prompted by user" do
            expect(game_config.strategy_selection(true)).to be_an_instance_of(EasyStrategy)
        end

        it "creates and returns an instance of AdvancedStrategy when prompted by user" do
            expect(game_config.strategy_selection(false)).to be_an_instance_of(AdvancedStrategy)
        end
    end

    describe "build_players" do
        it "creates human player instances in multi-player mode" do
            game_config.player_mode = false
            game_config.build_players
            expect(game_config.player1).to be_an_instance_of(Human)
            expect(game_config.player2).to be_an_instance_of(Human)
        end

        it "creates human and computer player instances in single-player mode" do
            game_config.player_mode = true
            game_config.build_players
            expect(game_config.player1).to be_an_instance_of(Computer)
            expect(game_config.player2).to be_an_instance_of(Human)
        end
    end
end