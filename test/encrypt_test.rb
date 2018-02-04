require './lib/encrypt'
require_relative "test_helper.rb"

class EncryptTest < Minitest::Test

  def test_if_it_exists
    encryptor = Encrypt.new("testing", "12345", 30218)

    assert_instance_of Encrypt, encryptor
  end

  def test_if_it_has_a_dictionary
    encryptor = Encrypt.new("testing", "12345", 30218)

    assert_equal ",", encryptor.dictionary.last
    assert_equal "a", encryptor.dictionary.first
    assert_equal 156, encryptor.dictionary.count
  end

  def test_it_can_take_one_input_letter
    my_message = "h"
    encryptor = Encrypt.new(my_message, "12345", 30218)

    assert_equal [["h"]], encryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_letter
    my_message = "he"
    encryptor = Encrypt.new(my_message, "12345", 30218)

    assert_equal [["h", "e"]], encryptor.input_message(my_message)
  end

  def test_it_can_take_one_input_word
    my_message = "hello"
    encryptor = Encrypt.new(my_message, "12345", 30218)

    assert_equal [["h", "e", "l", "l"], ["o"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_words_with_a_space
    my_message = "the cat"
    encryptor = Encrypt.new(my_message, "12345", 30218)

    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_take_multiple_input_words
    my_message = "the birds can tweet"
    encryptor = Encrypt.new(my_message, "12345", 30218)

    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    encryptor.input_message(my_message)
  end

end
