# frozen_string_literal: true

class Link < ApplicationRecord
  before_create :sanitize_long_url
  before_validation :generate_salt, :generate_short_url, on: [:create]

  validates :long_url, :short_url, :salt, presence: true
  validates :short_url, uniqueness: true

  def sanitize_long_url
    self.long_url = LongUrlSanitizer.new(long_url).sanitize
  end

  def generate_salt
    self.salt = SecureRandom.hex(5)
  end

  def generate_short_url

  end
end
