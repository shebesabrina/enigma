require 'pry'

class Rotator

  attr_reader :key,
              :date

  def initialize(date = DateTime.now.strftime("%d%m%y").to_i,
                 key = rand(10000..99999).to_s)
    @key = key
    @date = date
  end

  def generate_key_offset
    values = key.chars
    [values[0..1].join.to_i, values[1..2].join.to_i,
    values[2..3].join.to_i, values[3..4].join.to_i]
  end

  def generate_date_offset
    (date ** 2).digits[0..3].reverse
  end

  def generate_rotation
    generate_key_offset.each_with_index.map do |num, index|
      num + generate_date_offset[index]
    end
  end

end
