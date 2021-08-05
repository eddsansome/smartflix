# frozen_string_literal: true

RSpec.describe GetMovie::ByTitle, :vcr do
  describe '#call' do
    let(:movie) { GetMovie::ByTitle.call('titanic') }

    it 'should return a movie params' do
      expect(movie).to be_kind_of(Hash)
      expect(movie[:title]).to eq('Titanic')
    end
  end
end
