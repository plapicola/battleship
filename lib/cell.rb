class Cell

  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @fired_upon = false
    @ship = nil
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def render(show_ship = false)
    if fired_upon?
      if empty?
        "M"
      else
        if @ship.sunk?
          "X"
        else # Ship not sunk
          "H"
        end
      end
    else
      if empty?
        "."
      elsif show_ship
        "S"
      else
        "."
      end
    end
  end
end
