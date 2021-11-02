require 'game_config'

describe GameConfig do
    let (:board) { Board.new }
    let (:display) { Display.new(board) }
    let (:marker) { Marker.new("X", "O") }
    let (:manager) { PlayerManager.new(marker) }
    let (:test_player1) { Human.new(1, marker.p1_marker, "H")}
    let (:test_player2) { Human.new(2, marker.p2_marker, "H")}
    let (:game) { Game.new(board, test_player1, test_player2, display, manager) }
    let (:game_config) { GameConfig.new }

    before do
        game_config.instance_variable_set(:@marker, marker)
        game_config.instance_variable_set(:@game, game)
    end

    describe "humans_only?" do
        it "returns true if player chooses single player game" do
            allow(game_config.display).to receive(:get_player_type).and_return("H")
            expect(game_config.humans_only?).to eq(true)
        end

        it "returns false if player chooses computer player" do
            allow(game_config.display).to receive(:get_player_type).and_return("C")
            expect(game_config.humans_only?).to eq(false)
        end
    end

    describe "configure_players" do
        it "creates human player instances when prompted" do
            allow(game_config.display).to receive(:get_player_type).and_return("H")
            expect(game_config.humans_only?).to eq(true)
            game_config.configure_players
            expect(game_config.player1.marker).to eq("X")
        end
    end
end