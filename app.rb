require 'sinatra'
require 'rest-client'
require 'json'
require './lib/playlist.rb'

class App < Sinatra::Base

  get '/' do
    chosen_playlist = Playlist::Tracklist1
    new_playlist = Playlist::DeezerTracks.new(chosen_playlist)
    songs = new_playlist.getsongs

    erb :'index', locals: { songs: songs }
  end

end

