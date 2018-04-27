require_relative 'grid.rb'
require_relative 'boat.rb'
require_relative 'boat_list.rb'

class BattleshipsGame

  attr_accessor :guesses_left
  attr_reader :grid, :boat_1

  def initialize
    @guesses_left = 5
    @grid = Grid.new
    @boat_1 = Boat.new([2,3])
    @boat_2 = Boat.new([16,17])
    @boat_list = BoatList.new([@boat_1,@boat_2])
  end

  def convert_to_grid_point(user_input)
    user_input.to_i - 1
  end

  def input_not_in_correct_format?(user_input)
    user_input.to_i < 1 || user_input.to_i > 25
  end

 def input_has_been_entered_previously?(grid_point)
    @grid.input_has_been_entered_previously?(grid_point)
  end

  def hit?(grid_point)
    @boat_list.any_boat_hit?(grid_point)
  end

  def hit_mechanics(grid_point)
    @grid.record_hit(grid_point)
    @boat_list.record_boat_hit(grid_point)
  end

  def boat_sunk?(grid_point)
    @boat_list.boat_sunk?(grid_point)
  end

  def miss_mechanics(grid_point)
    @grid.record_miss(grid_point)
    @guesses_left -= 1
  end

  def won?
    @boat_list.all_boats_sunk?
  end

  def lost?
    @guesses_left == 0
  end

  def boats_left?
    @boat_list.count_boats_not_sunk
  end
end

