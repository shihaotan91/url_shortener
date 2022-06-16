# frozen_string_literal: true

class Link < ApplicationRecord
  before_create :sanitize_long_url

  validates :long_url, presence: true
  validates :short_url, presence: true,
                        uniqueness: true

  def sanitize_long_url
    self.long_url = LongUrlSanitizer.new(long_url).sanitize
  end
end
