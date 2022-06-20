# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  before do
    FactoryBot.create(:link)
  end

  describe 'validations' do
    context 'disable callbacks' do
      before do
        allow_any_instance_of(Link).to receive(:process_link)
      end

      it { is_expected.to validate_presence_of(:long_url) }
      it { is_expected.to validate_presence_of(:salt) }
      it { is_expected.to validate_presence_of(:short_url) }
      it { is_expected.to validate_uniqueness_of(:short_url) }
      it { is_expected.to validate_length_of(:short_url).is_equal_to(6) }
    end
  end

  describe 'callbacks' do
    context 'process_link' do
      before do
        allow(ProcessLink).to receive(:new).and_return(OpenStruct.new(call: true))
        Link.new(long_url: 'helloworld.com').valid?
      end

      it 'triggers the ProcessLink operation' do
        expect(ProcessLink).to have_received(:new)
      end
    end
  end
end
