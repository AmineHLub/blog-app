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

    it 'shows body content of index' do
      expect(response.body).to include('<h1>list of users is here</h1>')
    end
  end

  describe 'USERS GET #show' do
    before(:example) { get('/users/156') }

    it 'return 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the show template' do
      expect(response).to render_template(:show)
    end

    it 'shows body content of USERS#show' do
      expect(response.body).to include('<h1>user detail by id</h1>')
    end
  end
end
