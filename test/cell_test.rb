require_relative '../lib/cell'
require_relatibe '../lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_holds_a_coordinate
    skip
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_it_has_no_ship_when_created
    skip
    cell = Cell.new("B4")

    assert_nil cell.ship
  end

  def test_it_is_empty_when_created
    skip
    cell = Cell.new("B4")

    assert cell.empty?
  end

  def test_a_ship_can_be_placed_in_a_cell
    skip
    cell = Cell.new("B4")
    ship = Ship.new("Cruiser", 3)

    assert cell.empty?
    cell.place_ship(ship)
    assert_equal ship, cell.ship
    refute cell.empty?
  end
end
