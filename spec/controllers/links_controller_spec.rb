# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'GET new' do
    let(:init_link) { Link.new }

    before do
      allow(Link).to receive(:new).and_return init_link
      get :new
    end

    it 'renders the new page' do
      is_expected.to render_template(:new)
      expect(assigns(:link)).to eq(init_link)
    end
  end

  describe 'POST create' do
    let(:params) { { link: { long_url: long_url } } }

    before do
      post :create, params: params
    end

    describe 'when param is valid' do
      let(:long_url) { 'https://google.com' }
      let(:created_link) { Link.find_by(long_url: params[:link][:long_url]) }

      it 'creates a new link' do
        expect(Link.count).to eq 1
        expect(Link.first).to eq created_link
      end

      it 'redirects to the show page' do
        expect(response).to redirect_to(link_path(created_link.id))
        expect(assigns(:link)).to eq(created_link)
      end
    end

    describe 'when param is invalid' do
      let(:long_url) { 'google' }

      it 'renders the new page with error message' do
        is_expected.to render_template(:new)
        expect(assigns(:link).errors.messages[:long_url]).to eq ["Unable to shortern invalid url"]
      end
    end
  end

  describe 'GET show' do
    let(:created_link) { FactoryBot.create(:link) }

    before do
      get :show, params: { id: id }
    end

    describe 'when link exist' do
      let(:id) { created_link.id }

      it 'renders the show page' do
        is_expected.to render_template(:show)
        expect(assigns(:link)).to eq(created_link)
        expect(assigns(:short_url)).to eq("#{request.base_url}/#{created_link.short_url}")
      end
    end

    describe 'when link does not' do
      let(:id) { 0 }

      it 'renders the 404 page' do
        expect(response.status).to eq(404)
      end
    end
  end
end
