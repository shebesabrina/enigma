require './lib/enigma'
require_relative "test_helper.rb"

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_if_it_exists
    assert_instance_of Enigma, @e
  end

  def test_if_it_has_a_dictionary
    assert_equal ",", @e.dictionary.last
    assert_equal "a", @e.dictionary.first
    assert_equal 156, @e.dictionary.count
  end

  def test_it_can_take_one_input_letter
    assert_equal [["h"]], @e.input_message("h")
  end

  def test_it_can_take_two_input_letter
    assert_equal [["h", "e"]], @e.input_message("he")
  end

  def test_it_can_take_one_input_word
    assert_equal [["h", "e", "l", "l"], ["o"]], @e.input_message("hello")
  end

  def test_it_can_take_two_input_words_with_a_space
    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    @e.input_message("the cat")
  end

  # def test_it_brings_four_characters_at_a_time
  #
  #
  # end



end
