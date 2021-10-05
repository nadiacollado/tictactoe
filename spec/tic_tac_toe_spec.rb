require "tic_tac_toe"

describe TicTacToe do
    describe "welcome" do
        it "returns welcome string" do
            expect(TicTacToe.new.welcome()).to eq("\nWelcome to Tic-Tac-Toe!\n")
        end
    end

    describe "game_instructions" do
        it "returns game instructions string" do
            expect(TicTacToe.new.game_instructions()).to eq(
                "\nEach square in the board corresponds to a number 1-9.\nMake your move by entering the number in the square of your choice.\n")
        end
    end
    
end