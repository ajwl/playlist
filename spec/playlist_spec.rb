require 'rspec'
require 'vcr'
require 'webmock'
require_relative '../lib/playlist'

describe ".DeezerTracks" do

  context 'when track id is correct' do

    let(:tracklist){ [135875052, 135374660, 12291519] }

    it 'initialises with the chosen playlist' do

      new_playlist = Playlist::DeezerTracks.new(tracklist)
      expect(new_playlist.tracks).to eq(tracklist)

    end

    it 'calls the Deezer API to request the songs' do

      new_playlist = Playlist::DeezerTracks.new(tracklist)

      VCR.use_cassette('song call successful') do

        response = new_playlist.get_songs
        expect(response.first['title']).to eq('On Hold')

      end

    end
  end


  context 'when track id is wrong or missing' do

    let(:tracklist_error){ [13, 135374660, 12291519] }

    it 'ignores song and picks up the next one' do

      playlist_error = Playlist::DeezerTracks.new(tracklist_error)

      VCR.use_cassette('song call one error') do

        response = playlist_error.get_songs
        expect(response.first['title']).to eq('No Question')

      end

    end
  end

end