# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    long_url { SecureRandom.hex(10) }
    short_url { SecureRandom.hex(10) }
  end
end
