require "rubygems"
require "sinatra"
require "digest/sha1"

ACCEPTED_FILES = ["reference.txt"]

post "/:expected" do
  raise unless ACCEPTED_FILES.include?(params[:expected])

  expected = Digest::SHA1.hexdigest(File.read("samples/#{params[:expected]}"))
  actual = Digest::SHA1.hexdigest(params[:data][:tempfile].read)

  expected == actual ? "GOOD" : "BAD"
end
