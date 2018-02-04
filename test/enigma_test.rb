require './lib/enigma'
require './lib/rotator'
require './lib/encryptor'
require_relative "test_helper.rb"

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_if_it_exists
    assert_instance_of Enigma, @e
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
