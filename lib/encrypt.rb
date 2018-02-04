require './lib/enigma'
require 'date'
require 'pry'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", " ").chop
handle.close

e = Enigma.new
e.encrypt(incoming_text)

writer = File.open(ARGV[1], "w")
writer.write(e.encrypt(incoming_text))
writer.close

rotation =  e.rotation
puts "Created 'encypted.txt' with the key #{e.stored_key} and date #{e.stored_date}."
