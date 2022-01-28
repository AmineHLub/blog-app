require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize test data
  let!(:new_user) { create :user }
  let!(:posts) { create :post, user_id: new_user.id }
  let!(:posts1) { create :post, user_id: new_user.id }
  let!(:posts2) { create :post, user_id: new_user.id }
  let!(:posts3) { create :post, user_id: new_user.id }
  let!(:posts4) { create :post, user_id: new_user.id }
  let(:posts_id) { posts.first.id }

  # Test suite for GET /todos
  describe 'GET /posts' do
    # make HTTP get request before each example
    before { get '/api/v1/users/1/posts' }

    it 'returns posts for user' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
