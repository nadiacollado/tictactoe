require "tic_tac_toe"

describe TicTacToe do
    describe "welcome" do
        it "returns welcome string" do
            expect(TicTacToe.new.start_app()).to eq("Welcome to Tic-Tac-Toe!")
        end
    end
    
end