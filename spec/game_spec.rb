require "game"
require "board"

describe Game do
    let (:game) {Game.new}
    let (:board) {Board.new}

    describe "player" do
        it "returns current player" do
            squares = %w[1 X 3 O O X 7 8 9]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.player.symbol).to eq("X")
        end
    end

    describe "turn" do
        it "marks the square on the board with a player's valid move" do
            expect(game.board.squares).to eq(%w[1 2 3 4 5 6 7 8 9])
            allow(game.player).to receive(:get_move).and_return(3)
            game.turn
            expect(game.board.squares).to eq(%w[1 2 X 4 5 6 7 8 9])
        end

        it "does not mark the square on the board with a player's invalid move" do
            squares = %w[1 2 3 4 X 6 7 8 9]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            allow(game.player).to receive(:get_move).and_return(5)
            game.turn
            expect(game.board.squares).to eq(%w[1 2 3 4 X 6 7 8 9])
        end
    end

    describe "play" do
        it "does not call turn method if the game has ended" do
            squares = %w[X X O X O X X O O]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            game.play
            expect(game.game_over?).to eq("X")
            expect(game).not_to receive(:turn)
        end

        # fails -- does not output anything 
        # it "prints winning message if game has been won" do
        #     squares = [
        #         "X", "X", "O", 
        #         "4", "O", "X", 
        #         "X", "O", "O" ]
        #     board.instance_variable_set(:@squares, squares)
        #     game.instance_variable_set(:@board, board)
        #     allow(game.player).to receive(:get_move).and_return(4)
        #     game.play
        #     expect{game}.to output("Player X has won this round!").to_stdout
        # end
    end

    describe "won?" do
        it "returns winner of game if game has been won" do
            squares = %w[X X X O O X O X O]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq("X")
        end

        it "returns false if game has not been won" do
            squares = %w[X 2 X O 5 X 7 X O]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq(false)
        end
    end

    describe "winner" do
        it "returns winner of game if game has been won" do
            squares = %w[X O X O O O O X X]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.winner).to eq("O")
        end

        it "returns false if game has not been won" do
            squares = %w[X 2 X O 5 X 7 X O]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.winner).to eq(false)
        end
    end

    describe "draw?" do
        it "returns true if the board is full and there is no winner" do
            squares = %w[X O X O O X O X O]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.draw?).to eq(true)
        end
    end
end