require './lib/enigma'
require_relative "test_helper"

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
    assert_equal "Dgo1GFoB", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_second_letter
    my_message = "ki..end.."

    assert_equal "3 8ixcair", @e.encrypt(my_message, 30218, "12345")
    assert_equal "DKoBxPNB?", @e.encrypt(my_message, 30218, "12345")

  end

  def test_it_can_encrypt_a_four_letter_word
    my_message = "bell..end.."


    assert_equal "u6ivr0bxw08", @e.encrypt(my_message, 30218, "12345")
    assert_equal "uGV8?gO wgo", @e.encrypt(my_message, 30218, "12345")

  end

  def test_it_can_encrypt_two_words
    my_message = "bell hop..end.."

    assert_equal "u6ivq9lzr0bxw08", @e.encrypt(my_message, 30218, "12345")
    assert_equal "uGV8/JY,?gO wgo", @e.encrypt(my_message, 30218, "12345")

  end

  def test_it_can_encrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."

    assert_equal ",9bhtcp6xg7s.17ar0bxw08",
    assert_equal "MJOAtP2&xTn5Lhnt?gO wgo",

    @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_many_words_with_comma_period_and_spaces
     my_message = "the quick brown fox, jumps over the lazy dogs back...end.."

    assert_equal ",9bh9jfm3z.17lkhydujq.rw8h7yb6oh,9bh42w8q5lq.z.kv,8ir6knr0",
    @e.encrypt(my_message, 30218, "12345")

    assert_equal "MJOAJWSZDfL@HYXAyQ7C/L49IUn.OG1AMJOAEC9(/FY3LfLXvMoB?GX0?g",
    @e.encrypt(my_message, 30218, "12345")
  end

  def test_if_decrypt_method_returns_a_string
    assert_equal String, @e.decrypt("hello world", "30218", "12345").class
  end

  def test_it_can_decrypt_a_letter
    my_message = "k..end.."

    assert_equal "49O@7bOO", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_a_second_letter
    my_message = "ki..end.."

    assert_equal "4gOOYl!Oy", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_a_four_letter_word
    my_message = "bell..end.."

    assert_equal "Vc((y9@[X9O", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_two_words
    my_message = "bell hop..end.."

    assert_equal "Vc((xf]<y9@[X9O", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."

    assert_equal "!f@NUl:\\YpN^, NGy9@[X9O",
    @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_many_words_with_comma_period_and_spaces
     my_message = "the quick brown fox, jumps over the lazy dogs back...end.."

    assert_equal "!f@N s^,48.;8u[NZmaPxh?)9qN]#c;N!f@N5|cbxb]$,8. WiOOyc[!y9",
    @e.decrypt(my_message, "30218", "12345")
  end

end
