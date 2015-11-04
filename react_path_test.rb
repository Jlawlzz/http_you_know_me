require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './react_path'

class ReactPathTest < Minitest::Test

  def test_has_path
    rp = ReactPath.new
    assert_equal '/', rp.route_function('/')
  end

  def test_define_default_path_increases_counter
    rp = ReactPath.new
    assert_equal 1, rp.default_path
  end

  def test_hello_path_returns_hello_world
    rp = ReactPath.new
    assert_equal "Hello_World (0)", rp.hello_path
  end

  def test_datetime_returns_date_and_time
    rp = ReactPath.new
    assert_equal Time.new.strftime("%I:%M %p on %A, %B %d, %Y"), rp.datetime_path
  end

  def test_datetime_returns_shutdown_path
    rp = ReactPath.new
    assert_equal "Total Requests: 1", rp.shutdown_path
  end

end
