require 'sinatra'
require './lib/playlist.rb'
require './lib/tracklist1.rb'

class App < Sinatra::Base

  get '/' do
    chosen_playlist = Playlist::TRACKLIST1
    new_playlist = Playlist::DeezerTracks.new(chosen_playlist)
    songs = new_playlist.get_songs

    erb :'index', locals: { songs: songs }
  end

end

