class Game

  def initialize
    @name = "TwO-O-Player Math Game"
    @player_1 = Player.new("Player #1")
    @player_2 = Player.new("Player #2")
  end

  def name
    @name
  end

  def start_game()
    puts "----- LET'S BEGIN -----"
    loop do
      break
    end
    end_game
  end

  private
  
  def end_game
    @player_1.display_status
    @player_2.display_status
    puts "----- GAME OVER -----"
  end
end

