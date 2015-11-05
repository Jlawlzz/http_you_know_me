
class Game

  def initialize
    @number = rand(1..20)
    @guess_counter = 0
  end

  def start_game
    "Fine. Play the game. Good luck with figuring out the rules."
  end

  def guess_eval
    @guess_counter += 1
    game_stats = "You have made #{@guess_counter} guesses, you idiot!"
    if @number_guessed == @number
      game_stats + "\nYour guess was right... yay"
    elsif @number_guessed < @number
      game_stats + "\nYour number is too low, just like your test scores."
    elsif @number_guessed > @number
      game_stats + "\nYour number is too high, just like your self esteem"
    end
  end

  def guess_storage(guess)
    @number_guessed = guess.to_i
    "Re-Direct"
  end

end
