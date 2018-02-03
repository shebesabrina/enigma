require 'pry'
class Enigma

  attr_reader :dictionary

  def initialize
    @dictionary = [*('a'..'z'),*('0'..'9'),(" "),("."),(",")] * 4
  end

  def input_message(text)
    result = text.split("")
  end




end
