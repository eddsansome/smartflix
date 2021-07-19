# frozen_string_literal: true


VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.configure_rspec_metadata!
  config.hook_into :webmock
end

# add vcr here!
RSpec.describe GetMovie::ByTitle, :vcr do
  describe '#call' do
    let(:movie) { subject.call('titanic') } 

    it 'should return a movie' do

      expect(movie.title).to eq('Titanic')
      expect(movie.year).to eq(1997)
      expect(movie.actors.size).to eq(4)
      expect(movie.released).to eq('19 Dec 1997')
      expect(movie.metascore).to eq(75.0)
      expect(movie.imdbrating).to eq(7.8)
    end
  end

  describe "shit data", :vcr do
    it "should be handled gracefully" do
      expect { subject.call "This_AInt_a_FUCking_m0vie" }.to raise_error(Parsers::Movie::MovieParseError)
    end
  end
end
