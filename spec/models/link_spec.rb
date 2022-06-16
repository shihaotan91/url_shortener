# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  before do
    FactoryBot.create(:link)
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:long_url) }
    it { is_expected.to validate_presence_of(:short_url) }
    it { is_expected.to validate_uniqueness_of(:short_url) }

    context 'disable callbacks' do
      before do
        allow_any_instance_of(Link).to receive(:generate_salt)
      end

      it { is_expected.to validate_presence_of(:salt) }
    end
  end

  describe 'callbacks' do
    context 'sanitize_long_url' do
      let(:unsanitized_url) { 'helloworld' }

      it 'it sanitizes the long url before saving it' do
        link = Link.create!(long_url: 'helloworld', short_url: 'placeholder')
        expect(link.long_url).to eq(LongUrlSanitizer.new(unsanitized_url).sanitize)
      end
    end
  end
end
