# frozen_string_literal: true

class Link < ApplicationRecord
  before_validation :process_link, on: [:create]

  validates :long_url, :short_url, :salt, presence: true
  validates :short_url, uniqueness: true, length: { is: 6 }

  def process_link
    ProcessLink.new(self).call
  end
end
