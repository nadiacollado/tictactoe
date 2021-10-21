require 'board'

describe Board do
    let (:board) { Board.new }
    let (:symbols) { Symbols.new }
    let (:test_player) { Player.new("1", symbols.player1_marker) }
    describe "display_board" do
        it "returns game board diplay" do
            expect{board.display_board()}.to output("\n 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9\n        \n").to_stdout
        end
    end

    describe "valid_move?" do
        it "returns invalid message if player's move does not fall within the alloted 1-9 range" do
            expect{board.valid_move?(25, symbols.player1_marker, symbols)}.to output("Sorry that move is not valid. Please try again.\n").to_stdout
        end

        it "returns invalid message if the square is already taken" do
            board = Board.new(%w[X 2 X O 5 O O O 9])
            expect{board.valid_move?(1, symbols.player1_marker, symbols)}.to output("Sorry that move is not valid. Please try again.\n").to_stdout
        end

        it "marks the board if a player's move falls within range and the square is available" do
            board = Board.new(%w[X 2 3 4 5 O 7 8 9])
            expect(board.square_taken?(4, symbols)).to eq(false)
            board.valid_move?(4, symbols.player1_marker, symbols)
            expect(board.squares).to eq(%w[X 2 3 X 5 O 7 8 9])
        end
    end

    describe "square_taken?" do
        it "returns true when the square is taken" do
            board = Board.new(%w[X 2 X X 5 O O O 9])
            expect(board.square_taken?(4, symbols)).to be(true)
        end

        it "returns false when the square is free" do
            board = Board.new(%w[X 2 X 4 5 6 X 8 9])
            expect(board.square_taken?(4, symbols)).to be(false)
        end
    end

    describe "mark_square" do
        it "updates the board with a player's move" do
            board.mark_square(4, test_player.symbol)
            expect(board.squares).to eq(%w[1 2 3 X 5 6 7 8 9])
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

    describe "turn_count" do
        it "returns the number of turns that have been taken during the game" do
            board = Board.new(%w[X 2 X X 5 O 7 O 9])
            expect(board.turn_count(symbols)).to eq(5)
        end
    end
end