# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Http::GetMovie::ByTitle, :vcr do
  describe '#call' do
    subject { described_class.call(title) }

    context 'when searching for a valid movie' do
      let(:title) { 'titanic' }

      it 'returns a movie params' do
        expect(subject).to be_kind_of(Hash)
        expect(subject[:title]).to eq('Titanic')
      end
    end

    context 'when searching for an invalid movie' do
      let(:title) { 'I HATE VCR WITH A FIERY PASSION' }

      it 'logs an error to the console' do
        travel_to Time.utc(2021, 1, 1, 1, 1)
        expect(Rails.logger).to receive('warn').with('[2021-01-01 01:01:00 UTC] WARNING: I HATE VCR WITH A FIERY PASSION: Movie not found!')
        subject
      end
    end
  end
end
