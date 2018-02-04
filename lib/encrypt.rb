require_relative 'rotator'
require 'pry'

class Encrypt

  attr_reader :dictionary,
              :message,
              :rotation

  def initialize(message, key, date)
    @dictionary = [*('a'..'z'),*('0'..'9'),(" "),("."),(",")] * 4
    @message = message
    @rotation = Rotator.new(date = date, key = key).generate_rotation
  end

  def encrypted_message
    input_message(message).map do |characters|
      encrypt_quad_characters(characters)
    end.flatten.join("")
  end

  def input_message(message)
    message.split("").each_slice(4).map { |slice| slice }
  end

  def encrypt_quad_characters(characters)
    characters.each_with_index.map do |character, index|
      actual_index = dictionary.find_index(character)
      dictionary[actual_index + rotation[index]]
    end
  end

end
