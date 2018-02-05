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

    assert_equal "Dhp1GFpC", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_second_letter
    my_message = "ki..end.."

    assert_equal "DKpCxPNC?", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_a_four_letter_word
    my_message = "bell..end.."

    assert_equal "uGV8?hO whp", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_two_words
    my_message = "bell hop..end.."

    assert_equal "uGV8/JY,?hO whp", @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."

    assert_equal "MJOBtP2&xTo5Liou?hO whp",
    @e.encrypt(my_message, 30218, "12345")
  end

  def test_it_can_encrypt_many_words_with_comma_period_and_spaces
     my_message = "the quick brown fox, jumps over the lazy dogs back...end.."

    assert_equal "MJOBJWSZDgL@HYXByQ7D/L49IUo.OG1BMJOBEC9(/FY3LgLXvMpC?GX0?h",
    @e.encrypt(my_message, 30218, "12345")
  end

  def test_if_decrypt_method_returns_a_string
    assert_equal String, @e.decrypt("hello world", "30218", "12345").class
  end

  def test_it_can_decrypt_a_letter
    my_message = "k..end.."

    assert_equal "39O!6bOO", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_a_second_letter
    my_message = "ki..end.."

    assert_equal "3gOOXl,Oy", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_a_four_letter_word
    my_message = "bell..end.."

    assert_equal "Uc**y9!)W9O", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_two_words
    my_message = "bell hop..end.."

    assert_equal "Uc**xf[]y9!)W9O", @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_words_with_a_comma
    my_message = "the answer is, 3..end.."

    assert_equal ",f!NTl;|XpN%. NGy9!)W9O",
    @e.decrypt(my_message, "30218", "12345")
  end

  def test_it_can_decrypt_many_words_with_comma_period_and_spaces
     my_message = "the quick brown fox, jumps over the lazy dogs back...end.."

    assert_equal ",f!N9s%.38 >7u)NYmaPxh/(8qN[@c>N,f!N4?cbxb[#.8 9ViOOyc),y9",
    @e.decrypt(my_message, "30218", "12345")
  end

end
