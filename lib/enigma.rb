require 'pry'
class Enigma

  attr_reader :dictionary

  def initialize
    @dictionary = [*('a'..'z'),*('0'..'9'),(" "),("."),(",")] * 4
  end

  def input_message(text)
    encrypt_text = []
    text.split("").each_slice(4) { |slice| encrypt_text << slice }
    encrypt_text
  end




end
