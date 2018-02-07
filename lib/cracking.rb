require 'pry'

class Cracking

  attr_reader :dictionary_decrypt,
              :message,
              :date

  def initialize(message, date)
    dictionary = [*('a'..'z'), *('A'..'Z'), *('0'..'9'),(" "),("."),(","),
                  ("!"),("@"),("#"),("$"),("%"),("^"),("&"),("*"),("("),
                  (")"),("["),("]"),("<"),(">"),(";"),(":"),("/"),("?"),
                  ("|"), ('\\')] * 3
    @dictionary_decrypt = dictionary.reverse
    @message = message
    @date = date.to_i
  end

  def determine_rotation
    dictionary_crack = dictionary_decrypt.join
    result = message[-4..-1].split("")
    given = ["n", "d", ".", "."]
    result.each_with_index.map do |character, index|
      actual_index = dictionary_crack.index(character)
      required_index = dictionary_crack.index(given[index], (actual_index + 1))
      required_index - actual_index
    end
  end

  def generate_date_offset
    result = (date ** 2).digits[0..3].reverse
  end

  def generate_key_offset
    result = [(determine_rotation[0]-generate_date_offset[0]), (determine_rotation[1] -
      generate_date_offset[1]), (determine_rotation[2] -
      generate_date_offset[2]), (determine_rotation[3] -
        generate_date_offset[3])]
        binding.pry
        # binding.pry
  end



  # def cracked_message
  #   input_message(message).map do |characters|
  #     crack_quad_characters(characters)
  #   end.flatten.join("")
  # end

  def input_message(message)
    result = message.split("").each_slice(4).map { |slice| slice }
  end

  # def crack_quad_characters(characters)
  #   characters.each_with_index.map do |character, index|
  #     actual_index = dictionary_decrypt.find_index(character)
  #     dictionary_decrypt[actual_index + rotation[index]]
  #   end
  # end

end


# values = key.chars
# [values[0..1].join.to_i, values[1..2].join.to_i,
# values[2..3].join.to_i, values[3..4].join.to_i]
