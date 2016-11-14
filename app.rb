require 'sinatra'
require 'rest-client'
require 'json'
require 'config.yml'

class Playlist < Sinatra::Base

  get '/' do



    song1 = JSON.parse(RestClient.get('http://api.deezer.com/track/3135556'))

    erb :'index', locals:{ track1: song1, track2: song2 }
  end


end

