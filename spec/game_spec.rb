require 'game'

describe Game do
    let (:board) { Board.new }
    let (:rules) { Rules.new }
    let (:display) { Display.new(board) }
    let (:marker) { Markers.new("X", "O") }
    let (:strategy) { EasyStrategy.new }
    let (:test_player1) { Human.new(1, marker.p1) }
    let (:test_player2) { Computer.new(2, marker.p2, strategy) }
    let (:game) { Game.new(board, test_player1, test_player2, display) }

    describe "switch_player" do
        it "sets and returns current player" do
            expect(game.get_current_player.marker).to eq(marker.p1)
        end
    end

    describe "turn" do
        it "marks the square on the board with the correct player's valid move" do
            board = Board.new(%w[X 2 3 4 5 6 7 8 9])
            game.instance_variable_set(:@board, board)
            expect(game.board.squares).to eq(%w[X 2 3 4 5 6 7 8 9])
            allow(game.get_current_player).to receive(:get_move).and_return(3)
            game.turn
            expect(game.board.squares).to eq(%w[X 2 O 4 5 6 7 8 9])
        end

        it "does not mark the square on the board with a player's invalid move" do
            board = Board.new(%w[1 2 3 4 X 6 7 8 9])
            game.instance_variable_set(:@board, board)
            allow(game.get_current_player).to receive(:get_move).and_return(5)
            game.turn
            expect(game.board.squares).to eq(%w[1 2 3 4 X 6 7 8 9])
        end

        it "prints invalid move message if player input is invalid" do
            board = Board.new(%w[1 2 3 4 X 6 7 8 9])
            game.instance_variable_set(:@board, board)
            allow(game.get_current_player).to receive(:get_move).and_return(5)
            game.turn
            expect{game.turn}.to output(a_string_including(INVALID_MOVE)).to_stdout
        end
    end

    describe "play" do
        it "does not call turn method if the game has ended" do
            board = Board.new(%w[X X O X O X X O O])
            game.instance_variable_set(:@board, board)
            game.play
            expect(rules.game_over?(board)).to eq(marker.p1)
            expect(game).not_to receive(:turn)
        end
        
        it "prints winning message if game has been won" do
            board = Board.new(%w[X X O 4 O X X O O])
            game.instance_variable_set(:@board, board)
            allow(game.get_current_player).to receive(:get_move).and_return(4)
            expect(game.board.squares).to eq(%w[X X O 4 O X X O O])
            expect{game.play}.to output(a_string_including("Player X has won this round!")).to_stdout
        end

        it "prints draw message if game has been tied" do
            board = Board.new(%w[X X O O O 6 X O O])
            game.instance_variable_set(:@board, board)
            allow(game.get_current_player).to receive(:get_move).and_return(6)
            expect{game.play}.to output(a_string_including(TIE)).to_stdout
        end
    end
end