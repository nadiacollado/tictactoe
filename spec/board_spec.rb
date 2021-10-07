require "board"

describe Board do
    before do
        @board = Board.new
    end
    
    describe "initialize" do
        it "creates an array of string numbers 1-9" do
            expect(@board.squares).to eq(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
        end
    end
     
    describe "display_board" do
        it "returns game board diplay" do
            expect{@board.display_board()}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
        end
    end

    describe "valid_move?" do
        it "returns false if player's move falls outside of 1-9 range" do
            move = 25
            outcome = @board.valid_move?(move)
            expect(outcome).to eq(false)
        end

        #it "calls square_taken? once if player's move falls within 1-9 range" do
            #move = 4
            #expect(@board.valid_move?(4)).to receive(:square_taken?).once
        #end
    end

    describe "square_taken?" do
        # how to generate a double with the instance of the class that I need?
        #it "returns true when the square is taken" do
            #board = Board.new(%w[1 x 3 4 5 6 7 8 9])
            #move = 2
            #expect(board.square_taken?(move)).to be(false)
        #end

        it "returns false when the square is free" do
            move = 5
            expect(@board.square_taken?(move)).to be(true)
        end
    end
end