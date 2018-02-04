require './lib/enigma'
require './lib/encryptor'
require_relative "test_helper.rb"

class EncryptorTest < Minitest::Test

  def test_if_it_exists
    encryptor = Encryptor.new("testing", "12345", 30218)
    assert_instance_of Encryptor, encryptor
  end

  def test_if_it_has_a_dictionary
    encryptor = Encryptor.new("testing", "12345", 30218)
    assert_equal ",", encryptor.dictionary.last
    assert_equal "a", encryptor.dictionary.first
    assert_equal 156, encryptor.dictionary.count
  end

  def test_it_can_take_one_input_letter
    my_message = "h"
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal [["h"]], encryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_letter
    my_message = "he"
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal [["h", "e"]], encryptor.input_message(my_message)
  end

  def test_it_can_take_one_input_word
    my_message = "hello"
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal [["h", "e", "l", "l"], ["o"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_take_two_input_words_with_a_space
    my_message = "the cat"
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal [["t", "h", "e", " "], ["c", "a", "t"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_take_multiple_input_words
    my_message = "the birds can tweet"
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal [["t", "h", "e", " "], ["b", "i", "r", "d"],
    ["s", " ", "c", "a"], ["n", " ", "t", "w"], ["e", "e", "t"]],
    encryptor.input_message(my_message)
  end

  def test_it_can_encrypt_a_letter
    my_message = "k..end.."
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal "308o658i",
    encryptor.encrypted_message(my_message, "12345", 30218)
  end

  def test_it_can_encrypt_a_second_letter
    my_message = "ki..end.."
    encryptor = Encryptor.new(my_message, "12345", 30218)
    assert_equal "3 8ixcair",
    encryptor.encrypted_message(my_message, "12345", 30218)
  end

  def test_it_can_encrypt_a_four_letter_word
    my_message = "bell..end.."
    encryptor = Encryptor.new(my_message, "12345", 30218)

    assert_equal "u6ivr0bxw08",
    encryptor.encrypted_message(my_message, "12345", 30218)
  end

  def test_it_can_encrypt_two_words
    my_message = "bell hop..end.."
    encryptor = Encryptor.new(my_message, "12345", 30218)

    assert_equal "u6ivq9lzr0bxw08",
    encryptor.encrypted_message(my_message, "12345", 30218)
  end

  def test_it_can_encrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."
    encryptor = Encryptor.new(my_message, "12345", 30218)

    assert_equal ",9bhtcp6xg7s.17ar0bxw08",
    encryptor.encrypted_message(my_message, "12345", 30218)
  end

  def test_it_can_encrypt_many_words_with_comma_period_and_spaces
    my_message = "the quick brown fox, jumps over the lazy dogs back...end.."
    encryptor = Encryptor.new(my_message, "12345", 30218)

    assert_equal ",9bh9jfm3z.17lkhydujq.rw8h7yb6oh,9bh42w8q5lq.z.kv,8ir6knr0",
    encryptor.encrypted_message(my_message, "12345", 30218)
  end

end
