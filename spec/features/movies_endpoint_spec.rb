# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe 'Movie Page', :vcr, type: :feature do
  include ActiveJob::TestHelper

  context 'when movie is not in the DB' do
      before do
        Sidekiq::Testing.inline!
      end

    context 'when the movie exists on OMDB' do
      let(:title) { 'rambo' }

      it 'User navigates to /movies/title' do
        visit "/movies/#{title}"
        expect(page).to have_text('Sorry, not found - but we are adding more movies everyday!')
        visit current_path
        expect(page).to have_text('Rambo')
      end
    end

    context 'when the movie does not exist on OMDB' do
      let(:title) { 'TheRevengeofGrzegorzUnijewski' }

      it 'User navigates to /movies/title' do
        visit "/movies/#{title}"
        expect(page).to have_text('Sorry, not found - but we are adding more movies everyday!')
        visit current_path
        expect(page).to have_text('Sorry, not found - but we are adding more movies everyday!')
      end
    end
  end
end
