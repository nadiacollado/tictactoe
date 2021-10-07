require "tic_tac_toe"

describe TicTacToe do
    describe "welcome" do
        before do
            @app = TicTacToe.new
        end
        #how to do this?
        it "prints string" do
            #expect (@app.welcome()).to eq("\nWelcome to Tic-Tac-Toe!\n")
        end
        it "prints welcome message" do
            expect {@app.welcome()}.to output("\nWelcome to Tic-Tac-Toe!\n").to_stdout
        end
    end

    describe "game_instructions" do
        it "prints game instructions string" do
            expect{TicTacToe.new.game_instructions()}.to output(
                "\nEach square in the board corresponds to a number 1-9.\nMake your move by entering the number in the square of your choice.\n").to_stdout
        end
    end
    
end