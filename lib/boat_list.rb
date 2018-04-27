class BoatList

  def initialize(boat_list)
    @boat_list = boat_list
  end

  def any_boat_hit?(target_grid_point)
    @boat_list.each do |boat|
      return true if boat.any_point_matched?(target_grid_point)
    end
    false
  end

  def record_boat_hit(target_grid_point)
    @boat_list.each do |boat|
      if boat.any_point_matched?(target_grid_point)
        boat.record_hit(target_grid_point)
      end
    end
  end

  def boat_sunk?(target_grid_point)
    @boat_list.each do |boat|
      if boat.any_point_matched?(target_grid_point)
        return true if boat.sunk?
      end
    end
    false
  end

  def count_boats_not_sunk
    @boat_list.length - @boat_list.count {|boat| boat.sunk?}
  end

  def all_boats_sunk?
    @boat_list.all? {|boat| boat.sunk?}
  end
end
