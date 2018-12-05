require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class BoardTest < Minitest::Test

  def test_board_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_is_made_of_cells
    board = Board.new

    assert_equal 16, board.keys.length
    board.cells.each do |key, value|
      assert_instance_of Cell, value
    end
 end

end
