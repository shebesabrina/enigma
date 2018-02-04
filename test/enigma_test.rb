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
    my_message = "h"
    assert_equal [["h"]], @e.input_message(my_message)
  end

  def test_it_can_take_two_input_letter
    my_message = "he"
    assert_equal [["h", "e"]], @e.input_message(my_message)
  end

  def test_it_can_take_one_input_word
    my_message = "hello"
    assert_equal [["h", "e", "l", "l"], ["o"]], @e.input_message(my_message)
  end

  def test_it_can_take_two_input_words_with_a_space
    my_message = "the cat"
    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    @e.input_message(my_message)
  end

  def test_it_can_take_multiple_input_words
    my_message = "the birds can tweet"
    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    @e.input_message(my_message)
  end

  # def test_it_can_encrypt_a_letter
  #   assert_equal "308o658i", @e.encrypt("k..end..")
  # end
  #
  # def test_it_can_encrypt_a_second_letter
  #   assert_equal "3 8ixcair", @e.encrypt("ki..end..")
  # end
  #
  # def test_it_can_encrypt_a_four_letter_word
  #   assert_equal "u6ivr0bxw08", @e.encrypt("bell..end..")
  # end
  #
  # def test_it_can_encrypt_two_words
  #   assert_equal "u6ivq9lzr0bxw08", @e.encrypt("bell hop..end..")
  # end
  #
  # def test_it_can_encrypt_words_with_a_comma
  #   assert_equal ",9bhtcp6xg7s.17ar0bxw08",
  #   @e.encrypt("the answer is, 3..end..")
  # end
  #
  # def test_it_can_encrypt_many_words_with_comma_period_and_spaces
  #   assert_equal ",9bh9jfm3z.17lkhydujq.rw8h7yb6oh,9bh42w8q5lq.z.kv,8ir6knr0",
  #   @e.encrypt("the quick brown fox, jumps over the lazy dogs back...end..")
  # end

end
