# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedirectController, type: :controller do
  describe 'GET show' do
    let(:link) { FactoryBot.create(:link, long_url: 'https://google.com') }

    describe 'when link with short_url exist' do
      before { get :show, params: { short_url: link.short_url } }

      it 'redirects to the long url' do
        expect(response).to redirect_to(link.long_url)
      end
    end

    describe 'when link with short_url does not exist' do
      before { get :show, params: { short_url: 'missing_url' } }

      it 'redirects to the long url' do
        expect(response.status).to eq(404)
      end
    end
  end
end
