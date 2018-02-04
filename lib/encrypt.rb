require './lib/enigma'
require './lib/encryptor'
require './lib/rotator'
require 'date'
require 'pry'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read.gsub("\n", " ").chop
handle.close

e = Enigma.new
date = DateTime.now.strftime("%d%m%y").to_i
result  = e.encrypt(incoming_text, key = "12345", date = date)
