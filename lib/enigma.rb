require_relative 'encryptor'
require 'pry'

class Enigma

  def encrypt(message, key = "12345", date = 30218)
      Encryptor.new(message, key, date).encrypted_message
  end

end
