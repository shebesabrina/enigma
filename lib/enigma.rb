require_relative 'encryptor'
require 'pry'

class Enigma

  def encrypt(message, key, date)
      Encryptor.new(message, key = key, date = date).encrypted_message
  end

end
