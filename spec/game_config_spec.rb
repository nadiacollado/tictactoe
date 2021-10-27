require 'game_config'

describe GameConfig do
    let (:board) { Board.new }
    let (:marker) { Marker.new("X", "O") }
    let (:diplay) { Display.new(board) }
    let (:test_player1) { Player.new(1, marker.p1_marker)}
    let (:test_player2) { Player.new(2, marker.p2_marker)}
    let (:game) { Game.new(board, test_player1, test_player2) }
    let (:game_config) { GameConfig.new }

    # describe "create_game" do
    #     it "creates a game" do
    #         # marker = Marker.new("A", "B")
    #         # game_config.instance_variable_set(:@marker, marker)
    #         expect(game_config.create_game).to_not be(game)
    #     end
    # end

    # describe "start_game" do
    #     it "displays the game board" do
    #         game = Game.new(board, test_player1, test_player2)

    #         expect{game_config.start_game}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
    #     end
    # end

    describe "humans_only?" do
        it "returns true if player chooses single player game" do
            allow(game_config.display).to receive(:get_player_type).and_return("H")
            expect(game_config.humans_only?).to eq(true)
        end
    end
end