require 'sinatra'
require 'rest-client'
require 'json'
require './lib/playlist.rb'

class App < Sinatra::Base

  get '/' do

    api = Playlist::DEEZER_API
    songs = Playlist::SET1

    songs.map do |key, value|
      songs[key] = JSON.parse(RestClient.get("#{api}#{value}"))
    end

    p songs

    erb :'index', locals:{ songs: songs}
  end


end

