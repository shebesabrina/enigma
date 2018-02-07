require './lib/decryptor'

class Cracking

  attr_reader :message,
              :date,
              :key

  def initialize(message, date)
    @message = message
    @date = date.to_i
    @key = "9999"
  end

  def get_key
    sample_message = message[-7..-1]
    check = Decryptor.new(sample_message, @key, date)
    until check.decrypted_message == "..end.."
      @key = (@key.to_i + 1).to_s
      check = Decryptor.new(sample_message, @key, date)
    end
    @key
  end

end
