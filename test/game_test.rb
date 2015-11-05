require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/game'

class GameTest < Minitest::Test

  def test_start_game_displays_text
    g = Game.new
    assert_equal "Fine. Play the game. Good luck with figuring out the rules.", g.start_game
  end

  def test_guess_counter_goes_up
    g = Game.new
    g.guess_storage(1)
    g.guess_eval
    assert_equal 1, g.guess_counter
  end

  def test_guess_storage_saves_guess
    g = Game.new
    g.guess_storage(3)
    assert_equal 3, g.number_guessed
  end

  def test_guess_stores_and_evals_number
    g = Game.new
    g.guess_storage(30)
    assert_equal "You have made 1 guesses, you idiot!" + "\nYour number is too high, just like your self esteem", g.guess_eval
  end
end
