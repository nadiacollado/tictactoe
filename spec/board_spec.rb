require "board"

describe Board do
    before do
        @board = Board.new
    end
    
    describe "initialize" do
        it "should creates an array of string numbers 1-9" do
            expect(Board.new.squares).to eq(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
        end
    end
     
    describe "display_board" do
        it "should return game board diplay" do
            expect{@board.display_board()}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
        end
    end

    describe "valid_move?" do
        it "should return false if player's move falls outside of 1-9 range" do
            move = 25
            outcome = @board.valid_move?(move)
            expect(outcome).to eq(false)
        end

        it "should call square_taken? once if player's move falls within 1-9 range" do
            move = 4
            expect(@board.valid_move?(4)).to receive(:square_taken?).once
        end
    end
end