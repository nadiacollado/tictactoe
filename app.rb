require_relative './lib/tic_tac_toe'
require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/rules'

# start app

app = TicTacToe.new
app.print_welcome
app.print_game_instructions
app.print_board

# start game
board = Board.new
rules = Rules.new
symbols = Symbols.new
# symbols = Symbols.new("X", "O")
player1 = Player.new(1, symbols.player1_marker)
player2 = Player.new(2, symbols.player2_marker)
game = Game.new(board, player1, player2, rules, symbols)
game.play

