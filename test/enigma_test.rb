require './lib/enigma'
require_relative "test_helper.rb"

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new(date = 30218, key = 12345)
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

  def test_it_can_take_multiple_input_words
    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    @e.input_message("the birds can tweet")
  end

  def test_it_can_generate_a_key
    assert @e.key.class == Integer
    assert_equal 5, @e.key.to_s.length
    refute_equal 4, @e.key.to_s.length
  end

  def test_it_can_generate_a_key_offset
    assert_equal 4, @e.generate_key_offset.length
  end

  def test_it_can_generate_a_date
    assert @e.date.class == Integer
  end

  def test_it_can_square_the_date_and_return_last_four_digits
    assert @e.generate_date_offset.class == Array
    assert_equal 4, @e.generate_date_offset.length
  end

  def test_it_can_add_key_offset_and_date_offset
    assert @e.generate_rotation.class == Array
    assert_equal 4, @e.generate_rotation.length
  end

  def test_it_can_encrypt_a_letter
    assert_equal "308o658i", @e.encrypt("k..end..")
  end

  def test_it_can_encrypt_a_second_letter
    assert_equal "3 8ixcair", @e.encrypt("ki..end..")
  end

  def test_it_can_encrypt_a_four_letter_word
    assert_equal "u6ivr0bxw08", @e.encrypt("bell..end..")
  end

  def test_it_can_encrypt_two_words
    assert_equal "u6ivq9lzr0bxw08", @e.encrypt("bell hop..end..")
  end

  def test_it_can_encrypt_words_with_a_comma
    assert_equal ",9bhtcp6xg7s.17ar0bxw08",
    @e.encrypt("the answer is, 3..end..")
  end

  def test_it_can_encrypt_many_words_with_comma_period_and_spaces
    assert_equal ",9bh9jfm3z.17lkhydujq.rw8h7yb6oh,9bh42w8q5lq.z.kv,8ir6knr0",
    @e.encrypt("the quick brown fox, jumps over the lazy dogs back...end..")
  end

end
