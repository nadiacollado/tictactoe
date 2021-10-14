require "game"
require "board"

describe Game do
    let (:game) {Game.new}
    let (:board) {Board.new}

    describe "current_player" do
        it "returns current_player" do
            squares = [
                "1", "X", "3", 
                "O", "O", "X", 
                "7", "8", "9" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.current_player.symbol).to eq("X")
        end
    end

    describe "get_move" do
        it "returns player's move via the gets method" do
            allow(game).to receive(:gets).and_return("1")
            expect(game.get_move).to eq("1")
        end
    end

    describe "turn" do
        #it "prints a message prompting next player to make a move" do
            #squares = [
                #"X", "2", "3", 
                #"O", "5", "X", 
                #"7", "8", "9" ]
            #board.instance_variable_set(:@squares, squares)
            #game.instance_variable_set(:@board, board)
            #expect{game.turn}.to output("Player O, you're up!\n").to_stdout
        #end

        it "calls get_move" do
            allow($stdout).to receive(:puts)
            expect(game).to receive(:get_move).and_return("3")

            game.turn
        end

        it "calls validate_move with what is returned from get_move" do
            allow($stdout).to receive(:puts)
            expect(game).to receive(:get_move).and_return("3")
            expect(game).to receive(:validate_move).and_return(true)

            game.turn
        end
    end

    describe "validate_move" do
        it "marks the board if move is valid" do
            squares = [
                "X", "2", "3", 
                "4", "5", "6", 
                "7", "8", "9" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            game.validate_move(4)
            expect(board.squares[3]).to eq("O")
        end

        it "prints a message if move is invalid" do
            squares = [
                "X", "2", "3", 
                "O", "5", "6", 
                "7", "8", "9" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect{game.validate_move(4)}.to output("Sorry that move is not valid. Please try again.\n").to_stdout
        end
    end

    #describe "play" do
        #it "calls turn method if the game has not ended" do
            #squares = [
                #"X", "2", "3", 
                #"O", "5", "6", 
                #"7", "8", "9" ]
            #board.instance_variable_set(:@squares, squares)
            #game.instance_variable_set(:@board, board)
            #allow($stdout).to receive(:puts)
            #expect(game).to receive(:game_ended).and_return(false)
            #expect(game).to receive(:turn)

            #game.play
        #end
    #end

    describe "won?" do
        it "returns winner of game if game has been won" do
            squares = [
                "X", "X", "X", 
                "O", "O", "X", 
                "O", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq("X")
        end

        it "returns false if game has not been won" do
            squares = [
                "X", "2", "X", 
                "O", "5", "X", 
                "7", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.won?).to eq(false)
        end
    end

    describe "draw?" do
        it "returns true if the board is full and there is no winner" do
            squares = [
                "X", "O", "X", 
                "O", "O", "X", 
                "O", "X", "O" ]
            board.instance_variable_set(:@squares, squares)
            game.instance_variable_set(:@board, board)
            expect(game.draw?).to eq(true)
        end
    end
end