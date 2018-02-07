require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", "").strip
handle.close

e = Enigma.new

writer = File.open(ARGV[1], "w")
writer.write(e.encrypt(incoming_text))
writer.close

puts "Created 'encrypted.txt' with the key #{e.stored_key} and date \
#{e.stored_date}."
