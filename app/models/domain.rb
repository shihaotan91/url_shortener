# frozen_string_literal: true

class Domain < ApplicationRecord
  validates :name, presence: true
end
