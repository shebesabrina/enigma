require './lib/decryptor'
require './lib/encryptor'
require './lib/cracking'
require 'date'
require 'pry'

class Enigma

  attr_reader :stored_key,
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

  def crack(message = output, date = input_date)
    # binding.pry
    result = Cracking.new(message, date)
    result.generate_key_offset
    # result.cracked_message
  end

end
