require 'pry'
require './lib/encryptor'
require './lib/rotator'

class Enigma

  attr_reader :stored_key,
              :stored_date,
              :rotation

  def encrypt(message)
    result = Encryptor.new(message)
    @stored_key = result.stored_key
    @stored_date = result.stored_date
    @rotation = result.rotation
    result.encrypted_message
  end

end
