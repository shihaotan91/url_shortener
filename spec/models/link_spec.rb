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
  end
end
