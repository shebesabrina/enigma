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

    assert_equal "Dgo1GFoB", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_second_letter
    my_message = "ki..end.."

    assert_equal "DKoBxPNB?", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_four_letter_word
    my_message = "bell..end.."


    assert_equal "uGV8?gO wgo", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_two_words
    my_message = "bell hop..end.."

    assert_equal "uGV8/JY,?gO wgo", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."

    assert_equal "MJOAtP2&xTn5Lhnt?gO wgo",
    @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_many_words_with_comma_period_and_spaces
     my_message = "the quick brown fox, jumps over the lazy dogs back...end.."

    assert_equal "MJOAJWSZDfL@HYXAyQ7C/L49IUn.OG1AMJOAEC9(/FY3LfLXvMoB?GX0?g",
    @e.encrypt(my_message, 30218, "12345")
  end

  def test_if_decrypt_method_returns_a_string
    assert_equal String, @e.decrypt("rj*Dy#|GBq,/(j)v($", "84465", "80218").class
  end

  def test_it_can_decrypt_a_letter
    my_message = "qBA(t0AV"

    assert_equal "k..end..", @e.decrypt(my_message, "84465", "80218")
  end

  def test_it_can_decrypt_a_second_letter
    my_message = "cu2D/z;D3"

    assert_equal "ki..end..", @e.decrypt(my_message, "70747", "80218")
  end

  def test_it_can_decrypt_a_four_letter_word
    my_message = "t),z/W5BvWF"

    assert_equal "bell..end..", @e.decrypt(my_message, "96510", "80218")
  end

  def test_it_can_decrypt_two_words
    my_message = "vNt/?Qwa|nm|xn&"

    assert_equal "bell hop..end..", @e.decrypt(my_message, "13066", "80218")
  end

  def test_it_can_decrypt_words_with_a_comma
    my_message = ":9m<9#AL!&^x;H^^NGmC,G&"

    assert_equal "the answer is, 3..end..",
    @e.decrypt(my_message, "54911", "80218")
  end

  def test_it_can_decrypt_many_words_with_comma_period_and_spaces
     my_message = "B)A[ycEpsSxEweJ[n/T<^]Qzxa\\BD&N[B)A[t#VL^^KtASxnk<a]&&Jq&T"

    assert_equal "the quick brown fox, jumps over the lazy dogs back...end..",
    @e.decrypt(my_message, "86209", "80218")
  end

  def test_it_can_crack_multiple_words
    my_message = "!%EFXBlxN.9KLB,FP2EZWY>VjC5KICF"

    assert_equal "It is Raining like Crazy..end..", @e.crack(my_message, 70218)
  end

end
