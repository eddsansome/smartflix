# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Slug::FromParams do
  describe '#call' do
    subject { described_class.call(params) }

    context 'when creating a slug for a single word title' do
      let(:params) { { title: 'Titanic' } }
      it 'returns a downcased word' do
        expect(subject).to eq('titanic')
      end
    end
    context 'when creating a slug for a double word title' do
      let(:params) { { title: 'The Godfather' } }
      it 'returns a snakecased slug' do
        expect(subject).to eq('the_godfather')
      end
    end
    context 'when creating a slug for a triple word title' do
      let(:params) { { title: 'Men in Black' } }
      it 'returns a snakecased slug' do
        expect(subject).to eq('men_in_black')
      end
    end
  end
end