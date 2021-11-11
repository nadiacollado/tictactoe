require 'computer'

describe Computer do
    let (:marker) { Marker.new("X", "O") }
    let (:rules) { Rules.new }
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
    end

    describe "get_score" do
        it "returns a score of 0 if the board is clear" do
            board = %w[1 2 3 4 5 6 7 8 9]
            expect(ai_player.get_score(board)).to eq(0)
        end

        it "returns a score of 0 if the board is tied" do
            board = %w[X O X
                O X X
                O X O]
            expect(ai_player.get_score(board)).to eq(0)
        end

        it "returns a score of 10 if AI has won the game" do
            board = %w[
                X O O 
                O 5 O 
                X X X]
            expect(ai_player.get_score(board)).to eq(10)
        end

        it "returns a score of -10 if AI has lost the game" do
            board = %w[
                X 2 O
                X O X
                O 8 9]
            expect(ai_player.get_score(board)).to eq(-10)
        end
    end

    describe "maximizer" do
        it "" do
            
        end
    end

    describe "minimax" do
        # it "returns a score of 0 if the board is clear" do
        #     board = Board.new(%w[1 2 3 4 5 6 7 8 9])
        #     expect(ai_player.minimax(board)).to eq(0)
        # end

        # it "returns a score of 0 if the board is tied" do
        #     board = Board.new(%w[X O X O X X O X O])
        #     expect(ai_player.minimax(board)).to eq(0)
        # end
    end

    describe "copy_board" do
        it "makes a copy of the board" do
            board = %w[X 2 X 4 5 O O 8 9]
            expect(ai_player.copy_board(board)).to eq(%w[X 2 X 4 5 O O 8 9])
        end
    end


    describe "get_available_squares" do
        it "returns all available squares in a clear board" do
            board = %w[1 2 3 4 5 6 7 8 9]
            expect(ai_player.get_available_squares(board)).to eq(CLEAR_BOARD)
        end

        it "returns all available squares in a partially full board" do
            board = %w[1 2 X X 5 6 O O X]
            expect(ai_player.get_available_squares(board)).to eq(%w[1 2 5 6])
        end

        it "returns no available squares in a full board" do
            board = %w[O X X X O X O O X]
            expect(ai_player.get_available_squares(board)).to eq([])
        end
    end

    describe "mark_board" do
        it "marks the square in the board" do
            board = %w[1 2 3 4 5 6 7 8 9]
            ai_player.mark_board(board, 4, marker.p1_marker)
            expect(board).to eq(%w[1 2 3 X 5 6 7 8 9])
        end
    end

    describe "make_integer" do
        it "turns a move into an integer" do
            expect(ai_player.make_integer("4")).to eq(4)
        end
    end
end