require_relative './lib/game_config'
require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/display'
require_relative './lib/rules'
require_relative './lib/player'
require_relative './lib/markers'
require_relative './lib/human'
require_relative './lib/easy_strategy'
require_relative './lib/advanced_strategy'
require_relative './lib/computer'
require_relative './lib/constants'

game = GameConfig.new
game.create_game

