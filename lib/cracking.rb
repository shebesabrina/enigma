require './lib/decryptor'

class Cracking

  attr_reader :message,
              :date

  def initialize(message, date)
    @message = message
    @date = date.to_i
    @key = "9999"
  end

  def get_key
    check = Decryptor.new(message, @key, date)
    until check.decrypted_message[-7..-1] == "..end.."
      @key = (@key.to_i + 1).to_s
      check = Decryptor.new(message, @key, date)
    end
    @key
  end

end
