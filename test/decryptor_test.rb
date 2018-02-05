<<<<<<< HEAD
require './lib/decryptor.rb'
require_relative "test_helper.rb"
=======
require './lib/decryptor'
require_relative "test_helper"
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

class DecryptorTest < Minitest::Test

  def test_if_it_exists
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")
=======
    decryptor = Decryptor.new("testing", "30218", "12345")
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

    assert_instance_of Decryptor, decryptor
  end

  def test_if_it_has_a_dictionary
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")

    assert_equal ",", decryptor.dictionary_decrypt.first
    assert_equal "a", decryptor.dictionary_decrypt.last
    assert_equal 156, decryptor.dictionary_decrypt.count
=======
    decryptor = Decryptor.new("testing", "30218", "12345")

    assert_equal "\\", decryptor.dictionary_decrypt.first
    assert_equal "a", decryptor.dictionary_decrypt.last
    assert_equal 255, decryptor.dictionary_decrypt.count
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388
  end

  def test_it_can_take_one_input_letter
    my_message = "h"
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")
=======
    decryptor = Decryptor.new("testing", "30218", "12345")
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

    assert_equal [["h"]], decryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_letter
    my_message = "he"
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")
=======
    decryptor = Decryptor.new("testing", "30218", "12345")
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

    assert_equal [["h", "e"]], decryptor.input_message(my_message)
  end

  def test_it_can_take_one_input_word
    my_message = "hello"
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")
=======
    decryptor = Decryptor.new("testing", "30218", "12345")
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

    assert_equal [["h", "e", "l", "l"], ["o"]],
    decryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_words_with_a_space
    my_message = "the cat"
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")
=======
    decryptor = Decryptor.new("testing", "30218", "12345")
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    decryptor.input_message(my_message)
  end

  def test_it_can_take_multiple_input_words
    my_message = "the birds can tweet"
<<<<<<< HEAD
    decryptor = Decryptor.new("testing", 30218, "12345")
=======
    decryptor = Decryptor.new("testing", "30218", "12345")
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388

    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    decryptor.input_message(my_message)
  end

end
