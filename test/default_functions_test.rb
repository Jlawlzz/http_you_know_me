require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/default_functions'

class DefaultFunctionsTest < Minitest::Test

  def test_has_path
    df = DefaultFunctions.new
    assert_equal "Hello_World (2)", df.hello_path(3)
  end

  def test_define_default_path_increases_counter
      df = DefaultFunctions.new
    assert_equal nil, df.default_path
  end

  def test_word_search_evals_word
      df = DefaultFunctions.new
    assert_equal "dog is a word!", df.word_search(["GETS","/word_search?word=dog"])
  end

  def test_datetime_returns_date_and_time
      df = DefaultFunctions.new
    assert_equal Time.new.strftime("%I:%M %p on %A, %B %d, %Y"), df.datetime_path
  end

  def test_datetime_returns_shutdown_path
      df = DefaultFunctions.new
    assert_equal "Total Requests: 1\n Server is now shutdown.", df.shutdown_path(1)
  end

end
