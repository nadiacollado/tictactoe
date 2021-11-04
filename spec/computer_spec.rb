require 'computer'
require './lib/player'

describe Computer do
    let (:marker) { Marker.new("X", "O") }
    let (:player) { Player.new(COMPUTER_PLAYER) }
    let (:computer_player) { Computer.new(1, marker.p1_marker, COMPUTER_PLAYER)}

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

    describe "get_move" do
        it "returns a valid move from computer player" do
            board = Board.new(%w[1 X 3 X O O 7 8 9 ])
            expect(computer_player.get_move(board)).not_to eq(2)
            expect(computer_player.get_move(board)).not_to eq(4)
            expect(computer_player.get_move(board)).not_to eq(5)
            expect(computer_player.get_move(board)).not_to eq(6)
        end
    end
end