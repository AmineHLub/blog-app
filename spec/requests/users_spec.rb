require 'rails_helper'

RSpec.describe 'USERS', type: :request do
  describe 'USERS GET #index' do
    before(:example) { get('/users#index') }

    it 'server return 200 server ok' do
      expect(response).to have_http_status(200)
    end

    it 'template rendering correctly' do
      expect(response).to render_template(:index)
    end

    it 'shows body content of index (add post button)' do
      expect(response.body).to include('Add a new post')
    end
  end

  describe 'USERS GET #show' do
    before(:example) { get('/users/1') }

    it 'return 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the show template' do
      expect(response).to render_template(:show)
    end

    it 'shows body content of USERS#show' do
      expect(response.body).to include('Bio')
    end
  end
end
