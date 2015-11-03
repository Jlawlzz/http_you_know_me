require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './react_path'

class ReactPathTest < Minitest::Test

  def test_has_path
    rp = ReactPath.new("/")
    assert_equal '/', rp.path
  end

  # def test_default_path_returns_debug
  #   rp = ReactPath.new('/')
  # end



end
