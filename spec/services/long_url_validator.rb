require 'rails_helper'

RSpec.describe LongUrlValidator do
  context 'when url is valid' do
    let(:valid_urls) do
      [
        'https://google.sg',
        'http://google.com.sg',
        'www.google.kr',
        'google.com',
        'nus.edu.sg'
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
        'google.invalid',
        'google.invalid.com',
        'nus.edu.invalid',
        '<><><><>.com'
      ]
    end

    it 'returns false' do
      invalid_urls.each do |url|
        expect(described_class.new(url).valid?).to be_falsy
      end
    end
  end
end
