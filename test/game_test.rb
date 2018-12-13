require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_has_a_player_board
    # skip
    game = Game.new

    assert_instance_of Board, game.player_board
  end

  def test_it_has_a_computer_board
    # skip
    game = Game.new

    assert_instance_of Board, game.computer_board
  end
end
