require_relative '../lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < Minitest::Test
  def test_that_it_exists
    ship = Ship.new

    assert_instance_of Ship, ship
  end
end
