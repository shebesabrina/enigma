require './lib/enigma'
require_relative "test_helper.rb"

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_if_it_exists
    assert_instance_of Enigma, @e
  end

  def test_if_encrypt_method_returns_a_string
    assert_equal String, @e.encrypt("hello world", 30218, "12345").class
  end

  def test_it_can_encrypt_a_letter
    my_message = "k..end.."

    assert_equal "308o658i", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_second_letter
    my_message = "ki..end.."

    assert_equal "3 8ixcair", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_four_letter_word
    my_message = "bell..end.."

    assert_equal "u6ivr0bxw08", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_two_words
    my_message = "bell hop..end.."

    assert_equal "u6ivq9lzr0bxw08", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."

    assert_equal ",9bhtcp6xg7s.17ar0bxw08",
    @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_many_words_with_comma_period_and_spaces
     my_message = "the quick brown fox, jumps over the lazy dogs back...end.."

    assert_equal ",9bh9jfm3z.17lkhydujq.rw8h7yb6oh,9bh42w8q5lq.z.kv,8ir6knr0",
    @e.encrypt(my_message, 30218, "12345")
  end

end
