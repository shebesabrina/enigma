require 'date'
require 'pry'
class Enigma

  attr_reader :dictionary,
              :key

  def initialize
    @dictionary = [*('a'..'z'),*('0'..'9'),(" "),("."),(",")] * 4
    @key = rand(10000..99999)
  end

  def input_message(text)
    encrypt_text = []
    text.split("").each_slice(4) { |slice| encrypt_text << slice }
    encrypt_text
  end

  def generate_key_offset
    values = key.to_s.split("")
    result = [values[0..1].join.to_i, values[1..2].join.to_i,
    values[2..3].join.to_i, values[3..4].join.to_i]
  end

  def generate_date
    DateTime.now.strftime("%d%m%y").to_i
  end

  def generate_date_offset
    (generate_date ** 2).digits[0..3].reverse
  end

  def generate_rotation
    result = []
    generate_key_offset.each_with_index do |num, index|
      result << (num + generate_date_offset[index])
    end
    result
  end



end
