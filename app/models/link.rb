# frozen_string_literal: true

class Link < ApplicationRecord
  validates :long_url, presence: true,
                       length: { minimum: 8, maximum: 255 }

  validates :short_url, presence: true,
                        uniqueness: true
end
