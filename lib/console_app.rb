require_relative "battleships_game.rb"

class GameRunner

  def initialize(input = $stdin,output = $stdout)
    @input = input
    @output = output
    @game = BattleshipsGame.new
  end

  def play_game
    while @game.guesses_left > 0 && !@game.won?
      make_guess
      if @game.won?
        @output.puts "Yay! You won!"
      elsif @game.lost?
        @output.puts "Oh dear. Looks like you lost!"
      end
    end
  end

  def make_guess
    if @input_incorrect
      @output.puts "Input not in correct format."
    elsif @input_previously_entered
      @output.puts "You've already tried that one, please try another."
    elsif @hit
      @output.puts "You got one!"
      if @sunk
        @output.puts "And you sunk a boat!"
      end
    elsif @miss
      @output.puts "Oops, you missed, pal!"
    end

    @input_incorrect = false
    @input_previously_entered = false
    @hit = false
    @miss = false
    @sunk = false

    @output.puts "You have #{@game.guesses_left} guesses left to hit #{@game.boats_left?} boats."
    display_grid
    @output.puts "Please enter an input"
    user_input = @input.gets.chomp
    grid_point = @game.convert_to_grid_point(user_input)

    if @game.input_not_in_correct_format?(user_input)
      @input_incorrect = true
    elsif @game.input_has_been_entered_previously?(grid_point)
      @input_previously_entered = true
    else
      if @game.hit?(grid_point)
        @hit = true
        @game.hit_mechanics(grid_point)
        if @game.boat_sunk?(grid_point)
          @sunk = true
        end
      else
        @miss = true
        @game.miss_mechanics(grid_point)
      end
    end
  end

  def display_grid
    this_grid = @game.grid.grid_points.dup
    this_grid.insert(5,"\n") 
    this_grid.insert(11,"\n") 
    this_grid.insert(17,"\n") 
    this_grid.insert(23,"\n") 
    @output.puts this_grid.join
  end

end

@game_runner = GameRunner.new
@game_runner.play_game
