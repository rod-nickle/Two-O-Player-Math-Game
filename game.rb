require "./player"

class Game

  def initialize
    @name = "TwO-O-Player Math Game"
    @player_1 = Player.new("1")
    @player_2 = Player.new("2")
    @current_player = {
      player: @player_1,
      player_number: 1 
    }
    @current_sum = nil
    @current_answer = nil
  end

  def name
    @name
  end

  # This is the main method.
  # It has the control flow for the game.
  def start_game()
    loop do
      ask_question
      get_answer
      validate_answer
      if player_dead?
        break
      end
      change_player
    end
    end_game
  end

  # These methods are private
  private

  # Ask the player a question.
  def ask_question
    num_1 = rand(1..20)
    num_2 = rand(1..20)
    @sum = num_1 + num_2

    puts "\n----- READY #{current_player_name} -----"
    puts "#{current_player_name}: What does #{num_1} plus #{num_2} equal?"
  end

  # Get the player's answer from the console.
  def get_answer
    @answer = gets.chomp.to_i
  end

  # Is the answer correct?
  def validate_answer
    correct_answer = @sum == @answer

    if correct_answer
      puts "#{current_player_name}: YES! You are correct."
    else
      # Kill the Player (Decrease Life)
      current_player.kill_player
      puts "#{current_player_name}: Seriously? No!"
    end

    puts "#{@player_1.short_name}: #{@player_1.get_lives} vs #{@player_1.short_name}: #{@player_2.get_lives}"
  end 

  # Is the current player dead? i.e. Are all his lives lost?
  def player_dead?
    current_player.player_dead?
  end

  # Change the player after their turn.
  def change_player
    if @current_player[:player_number] == 1
      @current_player[:player] = @player_2
      @current_player[:player_number] = 2
    else
      @current_player[:player] = @player_1
      @current_player[:player_number] = 1
    end
    @current_sum = nil
    @current_answer = nil
  end

  # The game is over. Display the results.
  def end_game
    puts "\n----- GAME OVER -----"
    winner_name = @player_1.lives_remaining > @player_2.lives_remaining ? @player_1.name : @player_2.name
    winner_score = @player_1.lives_remaining > @player_2.lives_remaining ? @player_1.get_lives : @player_2.get_lives
    puts "#{winner_name} wins with a score of #{winner_score}"
    puts "Goodbye!"
  end

  def current_player
    @current_player[:player]
  end

  def current_player_name
    @current_player[:player].name
  end

end

