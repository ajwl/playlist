require 'rest-client'
require 'json'

module Playlist

  DEEZER_API = 'http://api.deezer.com/track/'

  class DeezerTracks

    attr_accessor :tracks

    def initialize(tracklist)
      @tracks = tracklist
    end

    def get_songs
      all_songs = []

      @tracks.each do |track|

        begin
          s = JSON.parse(RestClient.get("#{DEEZER_API}#{track}"))
        rescue
          raise StandardError => 'the call to the Deezer Api failed with #{e}'
        end

        all_songs << s unless s['error']
      end

      all_songs
    end

  end
end
