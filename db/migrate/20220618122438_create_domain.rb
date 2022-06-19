# frozen_string_literal: true

class CreateDomain < ActiveRecord::Migration[6.0]
  def change
    create_table :domains do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
