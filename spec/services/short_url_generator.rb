require 'rails_helper'

RSpec.describe ShortUrlGenerator do
  context 'generate' do
    let(:message) { 'helloworld' }

    it 'generates a short url' do
      short_code = Digest::SHA256.hexdigest(message)[0..5]
      expect(described_class.new(message).generate).to eq("#{ENV["ROOT_URL"]}/#{short_code}")
    end
  end
end
