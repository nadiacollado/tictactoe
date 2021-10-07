require "board"

describe Board do
    describe "initialize" do
        it "creates an array of string numbers 1-9" do
            expect(Board.new.squares).to eq(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
        end
    end
     
    describe "display_board" do
        it "returns game board diplay" do
            expect{Board.new.display_board()}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
        end
    end

    #describe "valid_move?" do
        #it "returns truthy or falsey value" do
            
        #end

        #it "checks if player's move falls within the allotted range" do
            
        #end

        #it "calls square_taken? with valid player move"
    #end
end