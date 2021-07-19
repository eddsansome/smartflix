# frozen_string_literal: true
Dotenv.load

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
  config.filter_sensitive_data('<🖕💩🖕>') { ENV['OMDB_API_KEY'] }
end

RSpec.describe GetMovie::ByTitle, :vcr do
  describe '#call' do
    let(:movie) { GetMovie::ByTitle.call('titanic') }

    it 'should return a movie params' do
      expect(movie).to be_kind_of(Hash)
      expect(movie[:title]).to eq('Titanic')
    end
  end
end
