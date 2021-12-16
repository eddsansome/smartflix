require 'rails_helper'

RSpec.describe 'Top50s', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/top50/index'
      expect(response).to have_http_status(:success)
    end
  end
end
