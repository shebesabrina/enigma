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
    cracking = Cracking.new("7A$3ICk:ewtue/", 70218)

    assert_equal "19898", cracking.get_key
  end

end
