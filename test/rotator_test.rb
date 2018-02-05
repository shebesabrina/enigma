require './lib/rotator'
require_relative "test_helper"

class RotatorTest < Minitest::Test

  def setup
    @rotator = Rotator.new(date = 30218, key = "12345")
  end

  def test_if_it_exists
    assert_instance_of Rotator, @rotator
  end

  def test_it_can_generate_a_key
    assert @rotator.key.class == String
    assert_equal 5, @rotator.key.to_s.length
    refute_equal 4, @rotator.key.to_s.length
  end

  def test_it_can_generate_a_key_offset
    assert_equal 4, @rotator.generate_key_offset.length
  end

  def test_it_can_generate_a_date
    assert @rotator.date.class == Integer
  end

  def test_it_can_square_the_date_and_return_last_four_digits
    assert @rotator.generate_date_offset.class == Array
    assert_equal 4, @rotator.generate_date_offset.length
  end

  def test_it_can_add_key_offset_and_date_offset
    assert @rotator.generate_rotation.class == Array
    assert_equal 4, @rotator.generate_rotation.length
  end

end
