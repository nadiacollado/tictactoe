require 'board'

describe Board do
    let (:board) { Board.new }
    let (:marker) { Marker.new("X", "O") }
    let (:test_player) { Human.new("1", marker.p1_marker, HUMAN_PLAYER) }

    describe "valid_move?" do
        it "returns false message if player's move does not fall within the alloted 1-9 range" do
            expect(board.valid_move?(25, marker.p1_marker)).to eq(false)
        end

        it "returns false if the square is already taken" do
            board = Board.new(%w[X 2 X O 5 O O O 9])
            expect(board.valid_move?(1, marker.p1_marker)).to eq(false)
        end

        it "returns true if a player's move falls within range and the square is available" do
            board = Board.new(%w[X 2 3 4 5 O 7 8 9])
            expect(board.valid_move?(4, marker.p1_marker)).to eq(true)
        end
    end

    describe "square_taken?" do
        it "returns true when the square is taken" do
            board = Board.new(%w[X 2 X X 5 O O O 9])
            expect(board.square_taken?(4)).to be(true)
        end

        it "returns false when the square is free" do
            board = Board.new(%w[X 2 X 4 5 6 X 8 9])
            expect(board.square_taken?(4)).to be(false)
        end
    end

    describe "mark_square" do
        it "updates the board with a player's move" do
            board.mark_square(4, test_player.marker)
            expect(board.squares).to eq(%w[1 2 3 X 5 6 7 8 9])
        end
    end

    describe "board_clear?" do
        it "returns true is board is clear" do
            board = Board.new(%w[1 2 3 4 5 6 7 8 9])
            expect(board.board_clear?).to be(true)
        end
    end

    describe "board_full?" do
        it "returns false if the board is not full" do
            board = Board.new(%w[X 2 X 4 5 O O O 9])
            expect(board.board_full?).to be(false)
        end

        it "returns true if board is full" do
            board = Board.new(%w[X O X X X O O O O])
            expect(board.board_full?).to be(true)
        end
    end

    describe "get_available_squares" do
        it "returns all available squares in a clear board" do
            board = Board.new(%w[1 2 3 4 5 6 7 8 9])
            expect(board.get_available_squares).to eq(CLEAR_BOARD_NUMERIC)
        end

        it "returns all available squares in a partially full board" do
            board = Board.new(%w[1 2 X X 5 6 O O X])
            expect(board.get_available_squares).to eq([1, 2, 5, 6])
        end

        it "returns no available squares in a full board" do
            board = Board.new(%w[O X X X O X O O X])
            expect(board.get_available_squares).to eq([])
        end
    end

    describe "turn_count" do
        it "returns the number of turns that have been taken in a game" do
            board = Board.new(%w[X 2 X 4 5 O O 8 9])
            expect(board.turn_count).to eq(4)
        end
    end

    describe "copy_board" do
        it "makes a copy of the board" do
            board = Board.new(%w[X 2 X 4 5 O O 8 9])
            expect(board.copy_board).to eq(%w[X 2 X 4 5 O O 8 9])
        end
    end
end