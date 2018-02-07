require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", "").strip
handle.close

e = Enigma.new

writer = File.open(ARGV[1], "w")
writer.write(e.crack(incoming_text, ARGV[2]))
writer.close

puts "Created 'cracked.txt' with the cracked key #{e.cracked_key} and date \
#{ARGV[2]}."
