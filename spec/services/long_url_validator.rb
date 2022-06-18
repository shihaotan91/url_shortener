require 'rails_helper'

RSpec.describe LongUrlValidator do
  context 'when url is valid' do
    let(:valid_urls) do
      [
        'https://google.sg',
        'www.google.edu',
        'google.com'
      ]
    end

    it 'returns true' do
      valid_urls.each do |url|
        expect(described_class.new(url).valid?).to be_truthy
      end
    end
  end

  context 'when url is invalid' do
    let(:invalid_urls) do
      [
        'https://google',
        'www.google',
        'google',
        'google.123'
      ]
    end

    it 'returns false' do
      invalid_urls.each do |url|
        expect(described_class.new(url).valid?).to be_falsy
      end
    end
  end
end
