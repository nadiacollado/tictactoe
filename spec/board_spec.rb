require "board"

describe Board do
    describe "display_board" do
        before do
            @board = Board.new
        end

        it "returns a string" do
            expect(@board.display_board()).to be_kind_of(String)
        end

        it "returns game board diplay" do
            expect(@board.display_board()).to eq(
        "
         1 | 2 | 3              
        -----------                 
         4 | 5 | 6              
        -----------                
         7 | 8 | 9")
        end
    end
end