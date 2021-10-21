require 'game'

describe Game do
    let (:player1) { Player.new(1, "X") }
    let (:player2) { Player.new(2, "O") }
    let (:board) { Board.new }
    let (:rules) { Rules.new }
    let (:symbols) { Symbols.new }
    let (:game) { Game.new(board, player1, player2, rules, symbols) }

    describe "get_current_player" do
        it "returns current player" do
            board = Board.new(%w[1 X 3 4 O X 7 8 9])
            game = Game.new(board, player1, player2, rules, symbols)
            expect(game.get_current_player.symbol).to eq(symbols.player2_marker)
        end
    end

    describe "turn" do
        it "marks the square on the board with a player's valid move" do
            expect(game.board.squares).to eq(%w[1 2 3 4 5 6 7 8 9])
            allow(game.get_current_player).to receive(:get_move).and_return(3)
            game.turn
            expect(game.board.squares).to eq(%w[1 2 X 4 5 6 7 8 9])
        end

        it "does not mark the square on the board with a player's invalid move" do
            board = Board.new(%w[1 2 3 4 X 6 7 8 9])
            game = Game.new(board, player1, player2, rules, symbols)
            allow(game.get_current_player).to receive(:get_move).and_return(5)
            game.turn
            expect(game.board.squares).to eq(%w[1 2 3 4 X 6 7 8 9])
        end
    end

    describe "play" do
        it "does not call turn method if the game has ended" do
            board = Board.new(%w[X X O X O X X O O])
            game = Game.new(board, player1, player2, rules, symbols)
            game.play
            expect(rules.game_over?(board, symbols)).to eq(symbols.player1_marker)
            expect(game).not_to receive(:turn)
        end
        
        it "prints winning message if game has been won" do
            board = Board.new(%w[X X O 4 O X X O O])
            game = Game.new(board, player1, player2, rules, symbols)
            allow(game.get_current_player).to receive(:get_move).and_return(4)
            expect{game.play}.to output(a_string_including("Player X has won this round!")).to_stdout
        end

        it "prints draw message if game has been tied" do
            board = Board.new(%w[X X O O O 6 X O O])
            game = Game.new(board, player1, player2, rules, symbols)
            allow(game.get_current_player).to receive(:get_move).and_return(6)
            expect{game.play}.to output(a_string_including("It's a draw! Better luck next time.")).to_stdout
        end
    end
end