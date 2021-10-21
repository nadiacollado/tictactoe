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
player1 = Player.new(1, "X")
player2 = Player.new(2, "O")
rules = Rules.new
game = Game.new(board, player1, player2, rules)
game.play

