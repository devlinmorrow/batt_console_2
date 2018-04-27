class Grid

  attr_reader :grid_points

  def initialize
    @grid_points = ["  01","  02","  03","  04","  05",
                    "  06","  07","  08","  09","  10",
                    "  11","  12","  13","  14","  15",
                    "  16","  17","  18","  19","  20",
                    "  21","  22","  23","  24","  25"]
  end

  def input_has_been_entered_previously?(grid_point)
    @grid_points[grid_point] == "⚓" || @grid_points[grid_point] == "☠" 
  end

  def record_hit(grid_point)
    @grid_points[grid_point] = "⚓"
  end

  def record_miss(grid_point)
    @grid_points[grid_point] = "☠"
  end
end
