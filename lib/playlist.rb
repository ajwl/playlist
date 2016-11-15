#TRACKLIST FOR APP

module Playlist

  DEEZER_API = 'http://api.deezer.com/track/'

  class DeezerTracks

    def initialize(tracklist)
      @tracks = tracklist
    end

    def get_songs
      all_songs = @tracks.each do |track|
        JSON.parse(RestClient.get("#{DEEZER_API}#{track}"))
      end
    end

  end

end