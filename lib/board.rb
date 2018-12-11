require_relative 'cell'

class Board
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

 def cells
  @cells
 end

 def valid_coordinate?(coordinate)
   @cells.has_key?(coordinate)
 end

 def valid_placement?(ship, coordinates)
   ship.length == coordinates.count
 end

 def consecutive_numbers(number)
   coordinates.each_cons(2) do|consecutive_pair|
     if consecutive_pair[1][1].to_i - consecutive_pair[0][1].to_i != 1  
       return false
     end
  end

 end
end
