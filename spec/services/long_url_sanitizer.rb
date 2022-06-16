require 'rails_helper'

RSpec.describe LongUrlSanitizer do
  let(:sanitized_url) { 'http://helloworld.com' }

  context 'remove_white_spaces' do
    context 'when url have white spaces in them' do
      it 'removes the white spaces' do
        url = 'http://hello world.com'
        expect(LongUrlSanitizer.new(url).sanitize).to eq sanitized_url
      end
    end
  end

  context 'add_leading_http' do
    context 'when url does not have leading http' do
      it 'adds leading http to it' do
        url = 'helloworld.com'
        expect(LongUrlSanitizer.new(url).sanitize).to eq sanitized_url
      end
    end

    context 'when url have leading http' do
      it 'retains the existing url' do
        expect(LongUrlSanitizer.new(sanitized_url).sanitize).to eq sanitized_url
      end
    end
  end

  context 'add_trailing_default_domain' do
    let(:sanitized_sg_url) { 'http://helloworld.sg' }

    context 'when url does not have a trailing domain' do
      it 'adds trailing default domain to it' do
        url = 'http://helloworld'
        expect(LongUrlSanitizer.new(url).sanitize).to eq sanitized_url
      end
    end

    context 'when url have leading http' do
      it 'retains the existing url' do
        expect(LongUrlSanitizer.new(sanitized_sg_url).sanitize).to eq sanitized_sg_url
      end
    end
  end
end
