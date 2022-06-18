# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  before do
    FactoryBot.create(:link)
  end

  describe 'validations' do
    context 'disable callbacks' do
      before do
        allow_any_instance_of(Link).to receive(:sanitize_long_url)
        allow_any_instance_of(Link).to receive(:generate_salt)
        allow_any_instance_of(Link).to receive(:generate_short_url)
      end

      it { is_expected.to validate_presence_of(:long_url) }
      it { is_expected.to validate_presence_of(:salt) }
      it { is_expected.to validate_presence_of(:short_url) }
      it { is_expected.to validate_uniqueness_of(:short_url) }
    end
  end

  describe 'callbacks' do
    let(:unsanitized_url) { 'helloworld.com' }
    let(:stubbed_salt) { 'ABCDE' }

    before do
      allow(SecureRandom).to receive(:hex).and_return(stubbed_salt)
    end

    context 'sanitize_long_url' do
      it 'it sanitizes the long url before saving it' do
        link = Link.create!(long_url: unsanitized_url)
        expect(link.long_url).to eq(LongUrlSanitizer.new(unsanitized_url).sanitize)
      end
    end

    context 'generate_salt' do
      it 'it sanitizes the long url before saving it' do
        link = Link.create!(long_url: unsanitized_url)
        expect(link.salt).to eq(stubbed_salt)
      end
    end

    context 'generate_short_url' do
      it 'it sanitizes the long url before saving it' do
        link = Link.create!(long_url: unsanitized_url)
        message = "#{link.long_url}_#{stubbed_salt}"
        expect(link.short_url).to eq(ShortUrlGenerator.new(message).generate)
      end
    end
  end
end
