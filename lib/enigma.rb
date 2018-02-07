require './lib/decryptor'
require './lib/encryptor'
require './lib/cracking'
require 'date'

class Enigma

  attr_reader :stored_key,
              :cracked_key,
              :stored_date,
              :rotation,
              :output

  def encrypt(message, date = DateTime.now.strftime("%d%m%y").to_i,
              key = rand(10000..99999).to_s)
    result = Encryptor.new(message, date, key)
    @stored_key = result.stored_key
    @stored_date = result.stored_date
    @rotation = result.rotation
    @output = result.encrypted_message
  end

  def decrypt(message = output, date = input_date, key = input_key)
    result = Decryptor.new(message, date, key)
    result.decrypted_message
  end

  def crack(message = output, date =  input_date)
    @cracked_key = Cracking.new(message, date).get_key
    decrypt(message, key = cracked_key, date)
  end

end
