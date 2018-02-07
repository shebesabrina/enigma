require './lib/cracking'
require_relative "test_helper"

class CrackingTest < Minitest::Test

  def test_if_it_exists
    cracking = Cracking.new("hello world", 70218)

    assert_instance_of Cracking, cracking
  end

  def test_it_has_attributes
    cracking = Cracking.new("hello world", 70218)

    assert_equal "hello world", cracking.message
    assert_equal 70218, cracking.date
  end

  def test_it_can_get_a_key
    cracking = Cracking.new("cw^^(b76)c8ayB87", 70218)

    assert_equal "17792", cracking.get_key
  end

  def test_it_can_get_another_key
    cracking = Cracking.new("(b76)c8ayB87", 70218)

    assert_equal "17792", cracking.get_key
  end

end
