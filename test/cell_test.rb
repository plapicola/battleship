require_relative '../lib/cell'
require_relative '../lib/ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CellTest < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_holds_a_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_it_has_no_ship_when_created
    cell = Cell.new("B4")

    assert_nil cell.ship
  end

  def test_it_is_empty_when_created
    cell = Cell.new("B4")

    assert cell.empty?
  end

  def test_a_ship_can_be_placed_in_a_cell
    cell = Cell.new("B4")
    ship = Ship.new("Cruiser", 3)

    assert cell.empty?
    cell.place_ship(ship)
    assert_equal ship, cell.ship
    refute cell.empty?
  end

  def test_cell_knows_if_fired_upon
    cell = Cell.new("B4")
    ship = Ship.new("Cruiser", 3)

    refute cell.fired_upon?
    cell.fire_upon
    assert cell.fired_upon?
  end

  def test_cells_ship_is_damaged_when_fired_upon
    cell = Cell.new("B4")
    ship = Ship.new("Cruiser", 3)

    cell.place_ship(ship)
    cell.fire_upon
    assert_equal 2, cell.ship.health
  end

  def test_cell_renders_M_when_shot_at_and_empty
    # skip
    cell = Cell.new("B4")

    assert_equal ".", cell.render
    cell.fire_upon
    assert_equal "M", cell.render
  end

  def test_cell_renders_H_on_hit_and_X_with_sunk_ship
    # skip
    cell = Cell.new("B4")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)

    assert_equal ".", cell.render
    cell.fire_upon
    assert_equal "H", cell.render
    2.times {cell.fire_upon}
    assert ship.sunk?
    assert_equal "X", cell.render
  end

  def test_cell_renders_S_for_ships_with_optional_flag
    # skip
    cell = Cell.new("B4")
    ship = Ship.new("Cruiser", 3)

    assert_equal ".", cell.render(true)
    cell.place_ship(ship)
    assert_equal "S", cell.render(true)
    cell.fire_upon
    assert_equal "H", cell.render(true)
  end


end
