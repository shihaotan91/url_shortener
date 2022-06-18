# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    long_url { "#{SecureRandom.alphanumeric(10)}.com" }
  end
end
