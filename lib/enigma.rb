require_relative 'encryptor'
require 'pry'

class Enigma

  def encrypt(message, key = "12345", date = Date.today)
      Encryptor.new(message, key, date).encrypted_message
  end

end
