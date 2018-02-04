require_relative 'encrypt'
require 'pry'

class Enigma

  def encrypt(message, key = "12345", date = Date.today)
      Encrypt.new(message, key, date).encrypted_message
  end

end
