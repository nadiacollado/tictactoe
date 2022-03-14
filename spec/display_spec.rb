require 'display'
require 'constants'
require 'computer'

describe Display do
    let (:marker) { Markers.new("Y", "Z") }
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
            expect {display.print_turn_prompt(marker.p2)}.to output(a_string_including("Player Z, you're up!")).to_stdout
        end
    end

    describe "print_winner" do
        it "prints a message pronouncing the winner of the game" do
            expect {display.print_winner(marker.p1)}.to output(a_string_including("Player Y has won this round!")).to_stdout
        end
    end

    describe "print_order_selection_prompt" do
        it "prints a message prompting player to choose player order" do
            expect {display.print_order_selection_prompt}.to output(a_string_including(PLAYER_ORDER_PROMPT)).to_stdout
        end
    end

    describe "print_computer_mode_prompt" do
        it "prints a message prompting player to choose easy or AI computer" do
            expect {display.print_computer_mode_prompt}.to output(a_string_including(COMPUTER_MODE_PROMPT)).to_stdout
        end
    end

    describe "validate_selection" do
        it "returns true if player inputs either #{CHOICE_ONE} or #{CHOICE_TWO}" do
            expect(display.validate_selection(CHOICE_ONE)).to be(true)
            expect(display.validate_selection(CHOICE_TWO)).to be(true)
        end

        it "returns false if player input is a string other than #{CHOICE_ONE} or #{CHOICE_TWO}" do
            expect(display.validate_selection("Apple")).to be(false)
        end
    end

    describe "get_player_mode" do
        it "returns the player's game mode selection via the gets method" do
            allow(display).to receive(:gets).and_return(CHOICE_ONE)
            expect(display.get_player_mode).to eq(true)
        end

        it "returns the player's game mode selection via the gets method" do
            allow(display).to receive(:gets).and_return(CHOICE_TWO)
            expect(display.get_player_mode).to eq(false)
        end
    end

    describe "get_computer_mode" do
        it "returns the player's computer mode selection via the gets method" do
            allow(display).to receive(:gets).and_return(CHOICE_ONE)
            expect(display.get_computer_mode).to eq(true)
        end

        it "returns the player's computer mode selection via the gets method" do
            allow(display).to receive(:gets).and_return(CHOICE_TWO)
            expect(display.get_computer_mode).to eq(false)
        end
    end

    describe "get_player_order" do
        it "returns the player's order selection via the gets method" do
            allow(display).to receive(:gets).and_return(CHOICE_ONE)
            expect(display.get_player_order).to eq(true)
        end

        it "returns the player's order selection via the gets method" do
            allow(display).to receive(:gets).and_return(CHOICE_TWO)
            expect(display.get_player_order).to eq(false)
        end
    end
end