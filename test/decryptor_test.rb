require './lib/decryptor.rb'
require_relative "test_helper.rb"

class DecryptorTest < Minitest::Test

  def test_if_it_exists
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_instance_of Decryptor, decryptor
  end

  def test_if_it_has_a_dictionary
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal "\\", decryptor.dictionary_decrypt.first
    assert_equal "a", decryptor.dictionary_decrypt.last
    assert_equal 255, decryptor.dictionary_decrypt.count
  end

  def test_it_can_take_one_input_letter
    my_message = "h"
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal [["h"]], decryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_letter
    my_message = "he"
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal [["h", "e"]], decryptor.input_message(my_message)
  end

  def test_it_can_take_one_input_word
    my_message = "hello"
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal [["h", "e", "l", "l"], ["o"]],
    decryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_words_with_a_space
    my_message = "the cat"
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    decryptor.input_message(my_message)
  end

  def test_it_can_take_multiple_input_words
    my_message = "the birds can tweet"
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    decryptor.input_message(my_message)
  end

  def test_it_can_decrypt_quad_characters
    characters = ["D", "q", "o", "t"]
    decryptor = Decryptor.new("testing", "88938", "80218")

    assert_equal ["t", "h", "e", " "],
    decryptor.decrypt_quad_characters(characters)
  end

  def test_it_can_decrypt_a_message
    my_message = "DqotlrBTC&mQx&D,onDu(nxT(*"
    decryptor = Decryptor.new(my_message, "88938", "80218")
    decryptor.input_message(my_message)

    assert_equal "the birds can tweet..end..",
    decryptor.decrypted_message
  end

end
