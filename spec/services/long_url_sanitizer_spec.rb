# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LongUrlSanitizer do
  let(:sanitized_url) { 'http://helloworld.com' }

  context 'remove_white_spaces' do
    context 'when url have white spaces in them' do
      it 'removes the white spaces' do
        url = 'http://hello world.com'
        expect(described_class.new(url).sanitize).to eq sanitized_url
      end
    end
  end

  context 'add_leading_http' do
    context 'when url does not have leading http' do
      it 'adds leading http to it' do
        url = 'helloworld.com'
        expect(described_class.new(url).sanitize).to eq sanitized_url
      end
    end

    context 'when url have leading http' do
      it 'retains the existing url' do
        expect(described_class.new(sanitized_url).sanitize).to eq sanitized_url
      end
    end
  end
end
