require "tic_tac_toe"

describe TicTacToe do
    let (:app) {TicTacToe.new}

    describe "print_welcome" do
        it "prints welcome message" do
            expect {app.print_welcome()}.to output("\nWelcome to Tic-Tac-Toe!\n").to_stdout
        end
    end

    describe "print_game_instructions" do
        it "prints game instructions" do
            expect{app.print_game_instructions()}.to output(
                "\nEach square in the board corresponds to a number 1-9.\nMake your move by entering the number in the square of your choice.\n").to_stdout
        end
    end
end