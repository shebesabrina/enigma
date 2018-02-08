require './lib/encryptor'
require_relative "test_helper"

class EncryptorTest < Minitest::Test

  def test_if_it_exists
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_instance_of Encryptor, encryptor
  end

  def test_if_it_has_a_dictionary
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_equal "\\", encryptor.dictionary.last
    assert_equal "a", encryptor.dictionary.first
    assert_equal 255, encryptor.dictionary.count
  end

  def test_it_can_take_one_input_letter
    my_message = "h"
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_equal [["h"]], encryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_letter
    my_message = "he"
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_equal [["h", "e"]], encryptor.input_message(my_message)
  end

  def test_it_can_take_one_input_word
    my_message = "hello"
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_equal [["h", "e", "l", "l"], ["o"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_words_with_a_space
    my_message = "the cat"
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_take_multiple_input_words
    my_message = "the birds can tweet"
    encryptor = Encryptor.new("testing", "30218", "12345")

    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_encrypt_quad_characters
    characters = ["t", "h", "e", " "]
    encryptor = Encryptor.new("testing", "80218", "88938")

    assert_equal ["D", "q", "o", "t"],
    encryptor.encrypt_quad_characters(characters)
  end

  def test_it_can_encrypt_a_message
    my_message = "the birds can tweet..end.."
    encryptor = Encryptor.new(my_message, "80218", "88938")
    encryptor.input_message(my_message)

    assert_equal "DqotlrBTC&mQx&D,onDu(nxT(*",
    encryptor.encrypted_message
  end

end
