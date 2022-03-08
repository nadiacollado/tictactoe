require 'advanced_strategy'

describe AdvancedStrategy do
    let (:strategy) { AdvancedStrategy.new }
    let (:marker) { Marker.new("X", "O") }
    let (:player) { Computer.new(1, marker.p1_marker, strategy) }

    describe "get_move" do
        it "returns the best move for AI to play" do
            board = Board.new(%w[O X X X 5 X 7 O O])
            expect(strategy.get_move(board, player.marker)).to eq(5)

            board1 = Board.new(%w[X 2 O O 5 O X X 9])
            expect(strategy.get_move(board1, player.marker)).to eq(9)

            board2 = Board.new(%w[X 2 O X 5 6 O 8 9])
            expect(strategy.get_move(board2, player.marker)).to eq(5)

            board2 = Board.new(%w[X O 3 X O 6 7 8 9])
            expect(strategy.get_move(board2, player.marker)).to eq(7)

            board1 = Board.new(%w[X 2 O X 5 6 7 8 O])
            expect(strategy.get_move(board1, player.marker)).to eq(7)
        end
    end

    describe "get_score" do
        it "returns a score of 0 if the board is tied" do
            board = Board.new(%w[X O X O X X O X O])
            expect(strategy.get_score(board, 8)).to eq(0)
        end

        it "returns the a score of 10 minus depth if AI has won the game" do
            board = Board.new(%w[X 2 O X O O X X X])
            expect(strategy.get_score(board, 6)).to eq(4)
        end

        it "returns a score of -10 plus depth if AI has lost the game" do
            board = Board.new(%w[X 2 O X O X O 8 9])
            expect(strategy.get_score(board, 5)).to eq(-5)
        end
    end

    describe "minimax" do
        it "returns the min score if human player wins" do
            board = Board.new(%w[X X O X X O O 8 9])
            expect(strategy.minimax(board, 6, false)).to eq(-3)
        end

        it "returns the max score if AI player wins" do
            board = Board.new(%w[X 2 O X 5 6 O 8 9])
            expect(strategy.minimax(board, 3, true)).to eq(4)
        end

        it "returns a score of 0 if the game ends in a tie" do
            board = Board.new(%w[X 2 3 4 O 6 7 8 9])
            expect(strategy.minimax(board, 1, true)).to eq(0)
        end
    end

    describe "score_comparison" do
        it "returns the max score when given a truthy value" do
            expect(strategy.score_comparison(25, 35, true)).to eq(35)
        end

        it "returns the min score when given a falsey value" do
            expect(strategy.score_comparison(25, 35, false)).to eq(25)
        end
    end

    describe "player_mark" do
        it "returns AI's mark when it's the maximizer's turn" do
            expect(strategy.player_mark(true)).to eq(AI)
        end

        it "returns the human player's when it's not the maximizer's turn" do
            expect(strategy.player_mark(false)).to eq(HUMAN)
        end
    end

    describe "make_integer" do
        it "turns a move into an integer" do
            expect(strategy.make_integer("4")).to eq(4)
        end
    end
end