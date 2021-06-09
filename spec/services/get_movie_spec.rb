# frozen_string_literal: true

require_relative '../../services/get_movie'

# add vcr here!
RSpec.describe Services::GetMovie do
  describe '#by_title' do
    let(:movie) { subject.by_title('titanic') } 
    it 'should return a movie' do
      expect(movie.title).to eq('Titanic')
      expect(movie.year).to eq(1997)
      expect(movie.actors.size).to eq(4)
      expect(movie.released).to eq('19 Dec 1997')
      expect(movie.metascore).to eq(75.0)
      expect(movie.imdbrating).to eq(7.8)
    end
  end

  describe '#by_id' do
    let(:movie) { subject.by_id('tt3896198') } 
    it 'should return a movie' do
      expect(movie.title).to eq('Guardians of the Galaxy Vol. 2')
      expect(movie.year).to eq(2017)
      expect(movie.actors.size).to eq(3)
      expect(movie.released).to eq('05 May 2017')
    end
  end

  describe "shit data" do
    it "should be handled gracefully" do
      expect { subject.by_id('t3896198') }.to raise_error(Services::Parsers::Movie::MovieParseError)
      expect { subject.by_title('THis_aint_a_fucking_mOvie') }.to raise_error(Services::Parsers::Movie::MovieParseError)
    end
  end
end
