require 'computer'

describe Computer do
    let (:marker) { Marker.new("X", "O") }
    let (:computer_player) { Computer.new(1, marker.p1_marker, COMPUTER_PLAYER)}
    let (:ai_player) { Computer.new(1, marker.p1_marker, AI_COMPUTER)}

    describe "initialize" do
        it "creates a computer player with given arguments" do
            expect(computer_player.id).to eq(1)
            expect(computer_player.marker).to eq(marker.p1_marker)
        end
    end

    describe "move_generator" do
        it "randomly selects a number 1-9" do
            expect(computer_player.move_generator).to be_between(1, 9)
        end
    end

    describe "get_move_easy" do
        it "returns a valid move from computer player" do
            board = Board.new(%w[1 X 3 X O O 7 8 9 ])
            expect(computer_player.get_move_easy(board)).not_to eq(2)
            expect(computer_player.get_move_easy(board)).not_to eq(4)
            expect(computer_player.get_move_easy(board)).not_to eq(5)
            expect(computer_player.get_move_easy(board)).not_to eq(6)
        end
    end

    describe "get_move_ai" do
        it "returns 5 as the best move if the board is clear" do
            board = Board.new(%w[1 2 3 4 5 6 7 8 9])
            expect(ai_player.get_move_ai(board, AI_COMPUTER)).to eq(5)
        end
    end

    describe "minimax" do
    end

    describe "best_move" do
    end
end