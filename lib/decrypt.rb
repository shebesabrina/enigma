require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", "").strip
handle.close

e = Enigma.new

writer = File.open(ARGV[1], "w")
writer.write(e.decrypt(incoming_text, ARGV[2], ARGV[3]))
writer.close

puts "Created 'decrypted.txt' with the key #{ARGV[2]} and date \
#{ARGV[3]}."
