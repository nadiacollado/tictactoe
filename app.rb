require_relative './lib/tic_tac_toe'
require_relative './lib/game'

# start app

app = TicTacToe.new
app.print_welcome
app.print_game_instructions

# start game

game = Game.new
game.play

