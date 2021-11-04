require 'rails_helper'

RSpec.describe TwatsController, type: :request do
  setup do
    user = create(:user)
    sign_in user
  end
  describe 'GET /twats' do
    it 'should get list of twats' do
      get twats_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /twats' do
    it 'should create twat' do
      twat = build(:twat)
      post twats_path, params: { twat: { twat: twat.twat, user: twat.user } }
      get root_url
      expect(response.body).to include 'Twat was successfully created.'
      expect(Twat.count).to eq(1)
    end
  end

  describe 'PUT /twats' do
    let(:twat) { create(:twat) }
    it 'should change twat with valid attributes' do
      put twat_path(twat), params: { twat: { twat: 'test twat' } }
      expect(twat.reload.twat).to eq('test twat')
      get root_url
      expect(response.body).to include 'Twat was successfully updated.'
    end

    it 'should not change twat with invalid attributes' do
      put twat_path(twat), params: { twat: { twat: 't', user: create(:user) } }
      expect(response.status).to eq(422)
      expect(twat.reload.twat).to eq(twat.twat)
    end
  end

  describe 'DELETE /twat' do
    let(:twat) { create(:twat) }
    it 'should delete twat' do
      delete twat_path(twat)
      expect(Twat.count).to eq(0)
      get root_url
      expect(response.body).to include 'Twat was successfully destroyed.'
    end
  end

end
