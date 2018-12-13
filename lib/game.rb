require_relative 'board'
require_relative 'ship'
class Game

  attr_reader :player_board,
              :computer_board

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ship = Ship.new("Cruiser", 3)
    @computer_ship = Ship.new("Cruiser", 3)
  end

  def start
    if main_menu == "p"
      setup
    end
  end

  def setup
    place_computer_ships
    place_player_ships
  end

  def place_computer_ships
  end

  def place_player_ships
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    gets.chomp
  end


end
