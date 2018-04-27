class Boat

  attr_reader :set_of_grid_points

  def initialize(set_of_grid_points)
    @set_of_grid_points = Hash.new
    set_of_grid_points.each do |grid_point|
      @set_of_grid_points[grid_point] = false
    end
  end

  def any_point_matched?(target_grid_point)
    @set_of_grid_points.each_key do |grid_point|
      return true if grid_point == target_grid_point
    end
    false
  end

  def record_hit(target_grid_point)
    @set_of_grid_points[target_grid_point] = true
  end

  def sunk?
    @set_of_grid_points.values.all?
  end
end
