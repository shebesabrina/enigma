require 'date'
require 'pry'

class Enigma

  attr_reader :dictionary

  def initialize
    @dictionary = [*('a'..'z'),*('0'..'9'),(" "),("."),(",")] * 4
  end

  def encrypt(message, key, date)
    input_message(message).map do |characters|
      encrypt_quad_characters(characters)
    end.flatten.join("")
  end

  def input_message(text)
    text.split("").each_slice(4).map { |slice| slice }
  end

  def encrypt_quad_characters(characters)
    characters.each_with_index.map do |character, index|
      actual_index = dictionary.find_index(character)
      dictionary[actual_index + generate_rotation[index]]
    end
  end

end
