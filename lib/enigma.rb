require './lib/encryptor'
require 'Date'

class Enigma

  attr_reader :stored_key,
              :stored_date,
              :rotation

  def encrypt(message, date = DateTime.now.strftime("%d%m%y").to_i,
              key = rand(10000..99999).to_s)
    result = Encryptor.new(message, date, key)
    @stored_key = result.stored_key
    @stored_date = result.stored_date
    @rotation = result.rotation
    result.encrypted_message
  end

end
