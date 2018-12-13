require_relative 'cell'

class Board

  attr_reader :cells

  def initialize
    @cells = generate_board
  end

  def generate_board
    {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.count &&
      all_valid?(coordinates) && all_empty?(coordinates)
      if consecutive_numbers(coordinates) &&
        same_letters(coordinates)
        return true
      end
      if consecutive_letters(coordinates) &&
        same_numbers(coordinates)
        return true
      end
    end
    return false
  end

  def all_valid?(coordinates)
    coordinates.all? do |coordinate|
      valid_coordinate?(coordinate)
    end
  end

  def all_empty?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def consecutive_numbers(coordinates)
    coordinates.each_cons(2) do|consecutive_pair|
      if consecutive_pair[1][1].to_i - consecutive_pair[0][1].to_i != 1
        return false
      end
    end
    return true
  end

  def consecutive_letters(coordinates)
    coordinates.each_cons(2) do|consecutive_pair|
      if consecutive_pair[1][0].ord - consecutive_pair[0][0].ord != 1
        return false
      end
    end
    return true
  end

  def same_numbers(coordinates)
    coordinates.all? do |coordinate|
      coordinate[1] == coordinates[0][1]
    end
  end

  def same_letters(coordinates)
    coordinates.all? do |coordinate|
      coordinate[0] == coordinates[0][0]
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(show_ships = false)
    rendered_board = "  1 2 3 4 \n"
    coordinates = @cells.keys
    current_key = 0

    4.times do
      rendered_board  += "#{coordinates[current_key][0]} " # Get letter
      4.times do
        rendered_board += "#{@cells[coordinates[current_key]].render(show_ships)} "
        current_key += 1
      end
      rendered_board += "\n"
    end
    return rendered_board
  end

  def fire_at(coordinate)
    if valid_coordinate?(coordinate)
      @cells[coordinate].fire_upon
    end
  end

end
