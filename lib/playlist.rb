require 'rest-client'
require 'json'

module Playlist

  DEEZER_API = 'http://api.deezer.com/track/'

  class DeezerTracks

    def initialize(tracklist)
      @tracks = tracklist
    end

    def get_songs
      all_songs = []
      @tracks.each do |track|
        s = JSON.parse(RestClient.get("#{DEEZER_API}#{track}"))
        all_songs << s
      end
      all_songs
    end

  end

end