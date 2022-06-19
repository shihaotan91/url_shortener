# frozen_string_literal: true

class AddSaltToLink < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :salt, :string, null: false
  end
end
