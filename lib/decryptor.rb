require './lib/rotator'
require 'pry'

class Decryptor

  attr_reader :dictionary_decrypt,
              :message,
              :rotation,
              :stored_key,
              :stored_date

  def initialize(message, key, date)
    dictionary = [*('a'..'z'), *('A'..'Z'), *('0'..'9'),(" "),("."),(","),
                  ("!"),("@"),("#"),("$"),("%"),("^"),("&"),("*"),("("),
                  (")"),("["),("]"),("<"),(">"),(";"),(":"),("/"),("?"),
                  ("|"), ('\\')] * 3
    @dictionary_decrypt = dictionary.reverse
    @message = message
    @rotator = Rotator.new(date = date, key = key)
    @rotation = @rotator.generate_rotation
    @stored_key = @rotator.key
    @stored_date = @rotator.date
  end

  def decrypted_message
    input_message(message).map do |characters|
      decrypt_quad_characters(characters)
    end.flatten.join("")
  end

  def input_message(message)
    result = message.split("").each_slice(4).map { |slice| slice }
  end

  def decrypt_quad_characters(characters)
    characters.each_with_index.map do |character, index|
      actual_index = dictionary_decrypt.find_index(character)
      dictionary_decrypt[actual_index + rotation[index]]
    end
  end

end
