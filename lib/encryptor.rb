require './lib/rotator'

class Encryptor

  attr_reader :dictionary,
              :message,
              :rotation,
              :stored_key,
              :stored_date

  def initialize(message, date, key)
    @dictionary = [*('a'..'z'), *('A'..'Z'), *('0'..'9'),(" "),("."),(","),
                  ("!"),("@"),("#"),("$"),("%"),("^"),("&"),("*"),("("),
                  (")"),("["),("]"),("<"),(">"),(";"),(":"),("/"),("?"),
                  ("|"), ('\\')] * 3
    @message = message
    rotator = Rotator.new(date, key)
    @rotation = rotator.generate_rotation
    @stored_key = rotator.key
    @stored_date = rotator.date
  end

  def encrypted_message
    result = input_message(message).map do |characters|
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
