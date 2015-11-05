
class Game

  def initialize
    @number = rand(1..20)
    @guess_counter = 0
  end

  def start_game
    "Go Fuck Yourself"
  end

  def guess_eval
    @guess_counter += 1
    "You have made #{@guess_counter} guesses, you idiot!"
    if @number_guessed == @number
      "Your guess was right... yay"
    elsif @number_guessed < @number
      "Your number is too low, just like your test scores."
    elsif @number_guessed > @number
      "Your number is too high, just like your self esteem"
    end
  end

  def guess_storage(guess)
    @number_guessed = guess.to_i
    "Re-Direct"
  end

end
