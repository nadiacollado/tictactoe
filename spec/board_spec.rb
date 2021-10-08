require "board"
require "player"

describe Board do
    let (:board) {Board.new}
    let (:test_player) {Player.new("1", "X")}
    valid_move = 4
    
    describe "initialize" do
        it "creates an array of string numbers 1-9" do
            expect(board.squares).to eq(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
        end
    end
     
    describe "display_board" do
        it "returns game board diplay" do
            expect{board.display_board()}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
        end
    end

    describe "valid_move?" do
        it "returns false if player's move falls outside of 1-9 range" do
            invalid_move = 25
            outcome = board.valid_move?(invalid_move)
            expect(outcome).to eq(false)
        end
        #ArgumentError: Cannot proxy frozen objects, rspec-mocks relies on proxies for method stubbing and expectations.
        #it "calls square_taken? once if player's move falls within 1-9 range" do
            #expect(board.valid_move?(valid_move)).to receive(:square_taken?).once
        #end
    end

    describe "square_taken?" do
        it "returns true when the square is taken" do
            board = Board.new(%w[X 2 X X 5 O O O 9])
            expect(board.square_taken?(valid_move)).to be(true)
        end

        it "returns false when the square is free" do
            expect(board.square_taken?(valid_move)).to be(false)
        end
    end


    describe "make_move" do
        it "updates the board with a player's move" do
            board.make_move(valid_move, test_player.symbol)
            update = board.squares[valid_move - 1]
            expect(update).to eq("X")
        end
    end

    describe "board_full?" do
        it "returns false if the board is not full" do
            board = Board.new(%w[X 2 X 4 5 O O O 9])
            expect(board.board_full?).to be(false)
        end

        it "returns true if board is full" do
            board = Board.new(%w[X O X X X O O O O])
            expect(board.board_full?).to be(true)
        end
    end

    describe "turn_count" do
        it "returns the number of turns that have been taken during the game" do
            board = Board.new(%w[X 2 X X 5 O 7 O 9])
            expect(board.turn_count).to eq(5)
        end
    end
end