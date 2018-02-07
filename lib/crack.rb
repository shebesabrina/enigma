require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", "").strip
handle.close

e = Enigma.new

writer = File.open(ARGV[1], "w")
input_date = ARGV[2]
writer.write(e.crack(incoming_text, input_date))
writer.close

# rotation =  e.rotation
# puts "Created 'cracked.txt' with the cracked key #{e.cracked_key} and date \
# #{input_date}."
