require 'display'
require 'constants'

describe Display do
    let (:marker) { Marker.new("Y", "Z") }
    let (:board) { Board.new }
    let (:display) { Display.new(board) }

    describe "print" do
        it "prints the message it is sent" do
            expect {display.print(WELCOME)}.to output(a_string_including("\n                   Welcome to Tic-Tac-Toe!\n")).to_stdout
        end
    end

    describe "print_board" do
        it "prints game board" do
            expect{display.print_board(board)}.to output(a_string_including("1 | 2 | 3\n")).to_stdout
        end
    end

    describe "print_turn_prompt" do
        it "prints a message prompting next player to make a move" do
            expect {display.print_turn_prompt(marker.p2_marker)}.to output(a_string_including("Player Z, you're up!")).to_stdout
        end
    end

    describe "print_winner" do
        it "prints a message pronouncing the winner of the game" do
            expect {display.print_winner(marker.p1_marker)}.to output(a_string_including("Player Y has won this round!")).to_stdout
        end
    end

    describe "validate_player_type" do
        it "returns true if player inputs either #{HUMAN_PLAYER} or #{COMPUTER_PLAYER}" do
            expect(display.validate_player_type(HUMAN_PLAYER)).to be(true)
            expect(display.validate_player_type(COMPUTER_PLAYER)).to be(true)
        end

        it "returns false if player input is a string other than #{HUMAN_PLAYER} or #{COMPUTER_PLAYER}" do
            expect(display.validate_player_type("Banana")).to be(false)
        end

        it "prints invalid selection message when player input is incorrect" do
            expect{display.validate_player_type("Banana")}.to output(a_string_including(INVALID_SELECTION)).to_stdout
        end
    end

    describe "get_player_type" do
        it "returns the player's game selection via the gets method" do
            allow(display).to receive(:gets).and_return(HUMAN_PLAYER)
            expect(display.get_player_type).to eq(HUMAN_PLAYER)
        end
    end

    describe "get_computer_type" do
        it "returns the player's computer selection via the gets method" do
            allow(display).to receive(:gets).and_return(EASY_COMPUTER)
            expect(display.get_computer_type).to eq(EASY_COMPUTER)
        end

        it "returns the player's computer selection via the gets method" do
            allow(display).to receive(:gets).and_return(AI_COMPUTER)
            expect(display.get_computer_type).to eq(AI_COMPUTER)
        end
    end

    describe "validate_computer_type" do
        it "returns true if player inputs either #{EASY_COMPUTER} or #{AI_COMPUTER}" do
            expect(display.validate_computer_type(EASY_COMPUTER)).to be(true)
            expect(display.validate_computer_type(AI_COMPUTER)).to be(true)
        end

        it "returns false if player input is a string other than #{EASY_COMPUTER} or #{AI_COMPUTER}" do
            expect(display.validate_computer_type("Apple")).to be(false)
        end
    end
end