require "tic_tac_toe"

describe TicTacToe do
    let (:board) {Board.new}
    let (:app) {Display.new(board)}

    describe "print" do
        it "prints the message it is sent" do
            GREETINGS = "Hello!"
            expect {app.print(GREETINGS)}.to output(a_string_including("Hello!")).to_stdout
        end
    end

    describe "print_board" do
        it "prints game board" do
            expect{app.print_board(board)}.to output(a_string_including(
                "\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n")).to_stdout
        end
    end
end