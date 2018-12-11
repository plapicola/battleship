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

    assert_equal 16, board.cells.keys.length
    board.cells.each do |key, value|
      assert_instance_of Cell, value
    end
 end

 def test_board_can_tell_if_a_valid_coordinate
   board = Board.new

   assert board.valid_coordinate?("A1")
   assert board.valid_coordinate?("C3")
   assert board.valid_coordinate?("D4")
   refute board.valid_coordinate?("D44")
 end

 def test_board_can_validate_placement_by_length
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)
   submarine = Ship.new("Submarine", 2)

   assert board.valid_placement?(cruiser, ["A1", "A2", "A3"])
   refute board.valid_placement?(submarine, ["A1", "A2", "A3"])
 end

 def test_board_can_validate_placement_by_consecutive
   skip
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)
   submarine = Ship.new("Submarine", 2)

   assert board.valid_placement?(cruiser, ["A1", "A2", "A3",])
   refute board.valid_placement?(submarine, ["A1", "A3"])
   assert board.valid_placement?(submarine, ["A1", "B1"])
 end

 def test_valid_placement_requires_no_diagonal
   skip
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)
   submarine = Ship.new("Submarine", 2)

   assert board.valid_placement?(cruiser, ["A1", "A2", "A3"])
   refute board.valid_placement?(cruiser, ["A1", "B2", "C3"])
   assert board.valid_placement?(submarine, ["A1", "B1"])
 end

 def test_has_ability_to_place_ships
   skip
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)

   assert board.valid_placement?(cruiser, ["A1", "A2", "A3"])
   board.place(cruiser, ["A1", "A2", "A3"])

   cell_1 = board.cells["A1"]
   cell_2 = board.cells["A2"]
   cell_3 = board.cells["A3"]

   assert_equal cell_1.ship, cruiser
   assert_equal cell_1.ship, cell_2.ship
   assert_equal cell_1.ship, cell_3.ship
 end

 def test_ships_cannot_overlap
   skip
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)
   submarine = Ship.new("Submarine", 2)

   assert board.valid_placement?(cruiser, ["A1", "A2", "A3"])
   assert board.valid_placement?(submarine, ["A1", "A2"])
   board.place(cruiser, ["A1", "A2", "A3"])
   refute board.valid_placement?(submarine, ["A1", "A2"])
 end

 def test_board_can_render_without_ships
   skip
   board = Board.new
   cruiser = Ship.new("Cruiser", 3)

   board.place(cruiser, ["A1", "A2", "A3"])

   expected = "  1 2 3 4 \n" +
              "A . . . . \n" +
              "B . . . . \n" +
              "C . . . . \n" +
              "D . . . . \n"

    assert_equal expected, board.render
  end

  def test_board_can_render_with_ships
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    expected = "  1 2 3 4 \n" +
               "A S S S . \n" +
               "B . . . . \n" +
               "C . . . . \n" +
               "D . . . . \n"

    assert_equal expected, board.render(true)
  end

  def test_board_can_render_all_ship_states
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["C1", "D1"])
    board.fire_at("A1")
    board.fire_at("C1")
    board.fire_at("D1")
    board.fire_at("D4")

    expected = "  1 2 3 4 \n" +
               "A H . . . \n" +
               "B . . . . \n" +
               "C X . . . \n" +
               "D X . . M \n"

     assert_equal expected, board.render
  end

  def test_board_can_render_all_ship_states_with_ships
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    board.place(submarine, ["C1", "D1"])
    board.fire_at("A1")
    board.fire_at("C1")
    board.fire_at("D1")
    board.fire_at("D4")

    expected = "  1 2 3 4 \n" +
               "A H S S . \n" +
               "B . . . . \n" +
               "C X . . . \n" +
               "D X . . M \n"

     assert_equal expected, board.render(true)
  end
end
