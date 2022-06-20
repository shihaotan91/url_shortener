# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProcessLink do
  let(:stubbed_salt) { 'ABCDE' }
  let(:link) { Link.new(long_url: unsanitized_url) }
  let(:operation) { described_class.new(link).call }

  before do
    allow(SecureRandom).to receive(:hex).and_return(stubbed_salt)
    operation
  end

  context 'when long_url is invalid' do
    let(:unsanitized_url) { 'helloworld' }

    it 'add errors to link' do
      expect(link.errors[:long_url]).to eq(['Unable to shortern invalid url'])
    end
  end

  context 'when long_url is valid' do
    let(:unsanitized_url) { 'helloworld.com' }

    context 'sanitize_long_url' do
      it 'assigns sanitized long_url to link' do
        expect(link.long_url).to eq(LongUrlSanitizer.new(unsanitized_url).sanitize)
      end
    end

    context 'generate_salt' do
      it 'assigns generated salt to link' do
        expect(link.salt).to eq(stubbed_salt)
      end
    end

    context 'generate_short_url' do
      it 'assigns generated short_url to link' do
        message = "#{link.long_url}_#{stubbed_salt}"
        expect(link.short_url).to eq(ShortUrlGenerator.new(message).generate)
      end
    end
  end
end
