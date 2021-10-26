require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/rules'
require_relative './lib/tic_tac_toe'
require_relative './lib/player'
require_relative './lib/marker'
require_relative './lib/game_config'

config = GameConfig.new
game = Game.new
game.setup_game(config)

