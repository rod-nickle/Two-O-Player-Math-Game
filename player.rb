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

  def display_status
    puts "Name: #{self.name} Score: #{@lives_remaining}/#{NUMBER_OF_LIVES_TO_START_GAME}"
  end

  def kill_player
    @lives_remaining -= 1
  end

  def player_dead?
    # puts "**** #{name} has #{@lives_remaining} lives remaining."
    if @lives_remaining <= 0
      return true
    else
      return false
    end
  end

end
