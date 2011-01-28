require "digest/sha1"

expected = Digest::SHA1.hexdigest(File.read(ARGV[0])) 
actual   = Digest::SHA1.hexdigest(File.read(ARGV[1]))

puts(expected == actual ? "GOOD" : "BAD")
