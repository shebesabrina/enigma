require './lib/enigma'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", "").chomp(" ")
handle.close

e = Enigma.new

writer = File.open(ARGV[1], "w")
writer.write(e.encrypt(incoming_text))
writer.close

rotation =  e.rotation
<<<<<<< HEAD
puts "Created 'encypted.txt' with the key #{e.stored_key} and date
=======
puts "Created 'encrypted.txt' with the key #{e.stored_key} and date \
>>>>>>> d3561cbb304f78d8f9134817f0b9d3778d822388
#{e.stored_date}."
