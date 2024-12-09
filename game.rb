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

  private

  def ask_question
    num_1 = rand(1..20)
    num_2 = rand(1..20)
    @sum = num_1 + num_2
    puts "\n----- READY #{@current_player[:player].name} -----"
    puts "#{@current_player[:player].name}: What does #{num_1} plus #{num_2} equal?"
  end

  def get_answer
    @answer = gets.chomp.to_i
  end

  def validate_answer
    correct_answer = @sum == @answer
    if correct_answer
      puts "#{@current_player[:player].name}: YES! You are correct."
    else
      # Kill Player (Decrease Life)
      @current_player[:player].kill_player
      puts "#{@current_player[:player].name}: Seriously? No!"
    end
    # puts "The correct answer is #{@sum}. Your answer is #{@answer}. Your answer is #{correct_answer}. "
    puts "#{@player_1.short_name}: #{@player_1.get_lives} vs #{@player_1.short_name}: #{@player_2.get_lives}"
  end 


  def player_dead?
    # puts "**** Is #{@current_player[:player].name} Dead? #{@current_player[:player].player_dead?}"
    @current_player[:player].player_dead?
  end

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

  def end_game
    puts "\n----- GAME OVER -----"
    winner_name = @player_1.lives_remaining > @player_2.lives_remaining ? @player_1.name : @player_2.name
    winner_score = @player_1.lives_remaining > @player_2.lives_remaining ? @player_1.get_lives : @player_2.get_lives
    puts "#{winner_name} wins with a score of #{winner_score}"
    puts "Goodbye!"
    # @player_1.display_status
    # @player_2.display_status
  end
end

