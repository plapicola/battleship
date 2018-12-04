require_relative '../lib/cell'
require_relatibe '../lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end
end
