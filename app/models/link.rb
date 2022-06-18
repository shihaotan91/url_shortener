# frozen_string_literal: true

class Link < ApplicationRecord
  before_validation :validate_long_url,
                    :sanitize_long_url,
                    :generate_salt,
                    :generate_short_url, on: [:create]

  validates :long_url, :short_url, :salt, presence: true
  validates :short_url, uniqueness: true

  def validate_long_url
    errors.add(:long_url, 'Unable to shortern invalid url') unless LongUrlValidator.new(long_url).valid?
  end

  def sanitize_long_url
    self.long_url = LongUrlSanitizer.new(long_url).sanitize
  end

  def generate_salt
    self.salt = SecureRandom.hex(5)
  end

  def generate_short_url
    message = "#{long_url}_#{ENV["SALT"]}_#{salt}"
    self.short_url = ShortUrlGenerator.new(message).generate
  end

end
