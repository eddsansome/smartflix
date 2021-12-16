require 'rails_helper'

RSpec.describe 'MovieSearches', type: :request do
  describe 'GET /search' do
    it 'returns http success' do
      get '/movie_search/search'
      expect(response).to have_http_status(:success)
    end
  end
end
