require "board"

describe Board do
    describe "display_board" do
        it "returns game board diplay" do
            expect{Board.new.display_board()}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
        end
    end
end