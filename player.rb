class Player
  NUMBER_OF_LIVES_TO_START_GAME = 3
  attr_reader :name, :score, :lives_remaining

  def initialize(name)
    @name = name
    @score = 0
    @lives_remaining = NUMBER_OF_LIVES_TO_START_GAME
  end

  def display_status
    puts ("Name: #{self.name} Score: #{self.score} Lives Remaining: #{self.lives_remaining}")
  end

end
