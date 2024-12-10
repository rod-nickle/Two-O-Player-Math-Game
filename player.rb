class Player
  NUMBER_OF_LIVES_TO_START_GAME = 3
  attr_reader :number, :lives_remaining

  def initialize(number)
    @number = number
    @lives_remaining = NUMBER_OF_LIVES_TO_START_GAME
  end

  def name
    "Player #{@number}"
  end

  def short_name
    "P#{@number}"
  end

  def get_lives 
    "#{@lives_remaining}/#{NUMBER_OF_LIVES_TO_START_GAME}"
  end

  # Kill the Player (Decrease Life)
  def kill_player
    @lives_remaining -= 1
  end

  # Is the player dead? i.e. Are all his lives lost? 
  def player_dead?
    if @lives_remaining <= 0
      return true
    else
      return false
    end
  end

end
