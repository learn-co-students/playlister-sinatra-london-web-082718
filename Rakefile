ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# # Type `rake -T` on your command line to see the available rake tasks.
# Genre.create(name: "Pop")
# Genre.create(name: "Rock")
# Genre.create(name: "Hip Hop")

Song.create(name: "Orinoco Flow", artist: "Enya", genre: "Weird")
Song.create(name: "Killing in the Name", artist: "Rage Againt the Machine", genre: "Rock")
Song.create(name: "2different", artist: "Bhuman", genre: "Pop")
Song.create(name: "Venus Fly", artist: "Grimes", genre: "Alt Pop")

task :console do
  Pry.start
end
