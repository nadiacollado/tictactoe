require 'easy_strategy'

describe EasyStrategy do
    let (:strategy) { EasyStrategy.new }
    let (:marker) { Marker.new("X", "O") }
    let (:player) { Computer.new(1, marker.p1_marker, strategy) }

    describe "move_generator" do
        it "randomly selects a number 1-9" do
            expect(strategy.move_generator).to be_between(1, 9)
        end
    end

    describe "get_move" do
        it "returns a valid move from computer player" do
            board = Board.new(%w[1 X 3 X O O 7 8 9 ])
            expect(strategy.get_move(board, player.marker)).not_to eq(2)
            expect(strategy.get_move(board, player.marker)).not_to eq(4)
            expect(strategy.get_move(board, player.marker)).not_to eq(5)
            expect(strategy.get_move(board, player.marker)).not_to eq(6)
        end
    end
end