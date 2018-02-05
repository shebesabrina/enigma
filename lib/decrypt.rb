require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", " ").chop
handle.close

e = Enigma.new

writer = File.open(ARGV[1], "w")
input_key = ARGV[2]
input_date = ARGV[3]
writer.write(e.decrypt(incoming_text, input_key, input_date))
writer.close

rotation =  e.rotation
puts "Created 'decrypted.txt' with the key #{input_key} and date \
#{input_date}."
