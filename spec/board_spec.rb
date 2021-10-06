require "board"

describe Board do
    describe "display_board" do
        before do
            @board = Board.new
            @display = @board.display_board
        end

        it "returns a string" do
            expect(@display).to be_kind_of(String)
        end

        it "returns game board diplay" do
            expect{@board.display_board()}.to output("
 1 | 2 | 3              
-----------                 
 4 | 5 | 6              
-----------                
 7 | 8 | 9"
).to_stdout
        end
    end
end