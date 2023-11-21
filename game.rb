require_relative './player'
require_relative './question'

class Game
  attr_accessor :current_player, :player_1, :player_2

  # Create two players, each with it own lives
  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @current_player = @player_1
  end

    
  # Change player based on turn
  def new_turn
    puts "----- NEW TURN -----"
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  # Play the game
  def start
    while @player_1.lives > 0 && @player_2.lives > 0
      # Ask the current player for a question
      question = Question.new
      current_question = question.new_question
      puts "#{@current_player.name}: #{current_question}"
      print "> "
      user_input = gets.chomp.to_i
            # Check if the answer is correct
      if user_input == question.answer
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously! No."
        @current_player.lives -= 1
      end

      # Show lives left
      puts "#{@player_1.name}: #{@player_1.lives}/3 vs #{@player_2.name}: #{@player_2.lives}/3"

      # Change player
      new_turn
    end
    
      if @player_1.lives == 0
        puts "#{@player_2.name} wins with a score of #{@player_2.lives}/3"
      else
        puts "#{@player_1.name} wins a score of #{@player_1.lives}/3"
      end
      puts "----- GAME OVER -----"
      puts "Good bye!"

  end

end

  