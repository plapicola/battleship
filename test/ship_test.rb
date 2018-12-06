require_relative '../lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < Minitest::Test
  def test_that_it_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end
                                                                                      ``
  def test_it_has_a_name
    ship = Ship.new("Cruiser", 3)
    ship_2 = Ship.new("Submarine", 2)

    assert_equal "Cruiser", ship.name
    assert_equal "Submarine", ship_2.name
  end

  def test_it_has_a_length
    ship = Ship.new("Cruiser", 3)
    ship_2 = Ship.new("Submarine", 2)

    assert_equal 3, ship.length
    assert_equal 2, ship_2.length
  end

  def test_it_starts_with_health_equal_to_length
    ship = Ship.new("Cruiser", 3)
    ship_2 = Ship.new("Submarine", 2)

    assert_equal 3, ship.health
    assert_equal 3, ship.length
    assert_equal 2, ship_2.health
    assert_equal 2, ship_2.length
  end

  def test_getting_hit_reduces_health
    ship = Ship.new("cruiser", 3)

    assert_equal 3, ship.health
    ship.hit
    assert_equal 2, ship.health
    ship.hit
    assert_equal 1, ship.health

  end

  def test_new_ship_isnt_sunk
    ship = Ship.new("Cruiser", 3)

    assert_equal false, ship.sunk?
  end

  def test_it_was_hit_and_the_ship_sank
    ship = Ship.new("cruiser", 3)

    assert_equal 3, ship.health
    3.times { ship.hit }
    assert_equal 0, ship.health
    assert_equal true, ship.sunk?
  end

end
